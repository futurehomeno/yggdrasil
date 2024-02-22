import 'package:flutter/material.dart';
import 'package:yggdrasil/src/generated/_generated.dart';
import 'package:yggdrasil/src/theme/_theme.dart';

import 'widgets/_widgets.dart';

part 'yg_wizard_header_from_animation.dart';
part 'yg_wizard_header_from_page_controller.dart';
part 'yg_wizard_header_from_tab_controller.dart';
part 'yg_wizard_header_regular.dart';

typedef CounterBuilderCallback = String Function(int currentStep, int steps);
typedef TitleBuilderCallback = String Function(int currentStep);

/// Implementation of the WizardHeader.
///
/// Can be used with a TabController though the [YgWizardHeader.fromTabController]
/// constructor or by manually specifying the current step and total steps.
///
/// Will animate the current step as shown in the progress bar. When used with a
/// tab controller will use the animations provided by the controller.
///
/// Hides the progress bar when there are more than 5 steps.
abstract class YgWizardHeader extends StatefulWidget {
  /// Self animated YgWizardHeader.
  ///
  /// Animates the [currentStep] value. Changing the amount of steps is not animated.
  const factory YgWizardHeader({
    required int currentStep,
    required int steps,
    required TitleBuilderCallback titleBuilder,
  }) = _YgWizardHeaderRegular;

  /// YgWizardHeader controlled by a TabController.
  ///
  /// Animates the current step together with the tabs.
  const factory YgWizardHeader.fromTabController({
    required TitleBuilderCallback titleBuilder,
    TabController controller,
  }) = _YgWizardHeaderFromTabController;

  /// YgWizardHeader controlled by a PageController.
  ///
  /// Animates the current step together with the pages.
  const factory YgWizardHeader.fromPageController({
    required PageController controller,
    required int steps,
    required TitleBuilderCallback titleBuilder,
  }) = _YgWizardHeaderFromPageController;

  /// YgWizardHeader controlled by a TabController.
  ///
  /// Animates the current step together with the tabs.
  const factory YgWizardHeader.fromAnimation({
    required Animation<double> animation,
    required int steps,
    required TitleBuilderCallback titleBuilder,
  }) = _YgWizardHeaderFromAnimation;

  const YgWizardHeader._({
    required this.titleBuilder,
  });

  /// The title of the Wizard header.
  final TitleBuilderCallback titleBuilder;
}

abstract class _YgWizardHeaderState<W extends YgWizardHeader> extends State<W> with TickerProviderStateMixin {
  /// The maximum amount of steps that will be rendered as a progress bar.
  static const int _maxVisibleSteps = 5;

  /// The animation used to drive the animations in this widget.
  Animation<double> get _valueAnimation;
  late Animation<double> _currentValueAnimation;

  /// Gets the current total steps.
  int get _steps;
  late int _currentSteps = _steps;

  /// Gets the current step displayed in the counter.
  int get _step;
  late int _currentStep = _step;

  @override
  void initState() {
    super.initState();
    _currentValueAnimation = _valueAnimation;
    _currentValueAnimation.addListener(_checkRebuild);
  }

  @override
  void didUpdateWidget(covariant W oldWidget) {
    super.didUpdateWidget(oldWidget);
    _currentStep = _step;
    _currentSteps = _steps;
    if (_currentValueAnimation != _valueAnimation) {
      _currentValueAnimation.removeListener(_checkRebuild);
      _currentValueAnimation = _valueAnimation;
      _currentValueAnimation.addListener(_checkRebuild);
    }
  }

  void _checkRebuild() {
    final bool stepChanged = _step != _currentStep;
    final bool stepsChanged = _steps != _currentSteps;
    if (stepChanged) {
      _currentStep = _step;
    }
    if (stepsChanged) {
      _currentSteps = _steps;
    }
    if (stepChanged || stepsChanged) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _currentValueAnimation.removeListener(_checkRebuild);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final YgWizardHeaderTheme theme = context.wizardHeaderTheme;

    return Container(
      color: theme.backgroundColor,
      padding: theme.padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              if (_currentSteps <= _maxVisibleSteps)
                Expanded(
                  child: Padding(
                    padding: theme.barPadding,
                    child: SizedBox(
                      height: theme.barStroke,
                      child: CustomPaint(
                        painter: WizardProgressPainter(
                          steps: _currentSteps,
                          value: _valueAnimation,
                          stroke: theme.barStroke,
                          gap: theme.barSegmentGap,
                          backgroundColor: theme.barBackgroundColor,
                          foregroundColor: theme.barForegroundColor,
                        ),
                      ),
                    ),
                  ),
                ),
              Text(
                DefaultYggdrasilLocalizations.current.wizardHeaderNOfN(
                  _currentStep + 1,
                  _currentSteps,
                ),
                style: context.wizardHeaderTheme.counterTextStyle,
              ),
            ],
          ),
          Padding(
            padding: theme.titlePadding,
            child: Text(
              widget.titleBuilder(_currentStep),
              style: theme.titleTextStyle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
