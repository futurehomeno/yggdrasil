import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/src/theme/wizard_header/wizard_header_theme.dart';

import 'widgets/_widgets.dart';

part 'yg_wizard_header_from_tab_controller.dart';
part 'yg_wizard_header_regular.dart';

typedef CounterBuilderCallback = String Function(int step, int steps);

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
  /// Animates the [step] value. Changing the amount of steps is not animated.
  const factory YgWizardHeader({
    required CounterBuilderCallback counterBuilder,
    required int step,
    required int steps,
    required String title,
  }) = _YgWizardHeaderRegular;

  /// YgWizardHeader controlled by a TabController.
  ///
  /// Animates the current step together with the tabs.
  const factory YgWizardHeader.fromTabController({
    required CounterBuilderCallback counterBuilder,
    required TabController controller,
    required String title,
  }) = _YgWizardHeaderFromTabController;

  const YgWizardHeader._({
    required this.counterBuilder,
    required this.title,
  });

  /// The title of the Wizard header.
  final String title;

  /// Builds the current counter.
  ///
  /// Gets passed the current step and the total amount of steps.
  final CounterBuilderCallback counterBuilder;
}

abstract class _YgWizardHeaderState<W extends YgWizardHeader> extends State<W> with TickerProviderStateMixin {
  static const int _maxVisibleSteps = 5;

  /// The animation used to drive the animations in this widget.
  Animation<double> get _valueAnimation;

  /// Gets the current total steps.
  int _getSteps();

  /// Gets the current step displayed in the counter.
  int _getStep();

  @override
  Widget build(BuildContext context) {
    final int steps = _getSteps();
    final YgWizardHeaderTheme theme = context.wizardHeaderTheme;

    return Container(
      color: theme.backgroundColor,
      padding: theme.padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              if (steps <= _maxVisibleSteps)
                Expanded(
                  child: Padding(
                    padding: theme.barPadding,
                    child: SizedBox(
                      height: theme.barStroke,
                      child: CustomPaint(
                        painter: WizardProgressPainter(
                          steps: steps,
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
              CounterBuilder(
                animation: _valueAnimation,
                getStep: _getStep,
                getSteps: _getSteps,
                buildCounter: widget.counterBuilder,
              ),
            ],
          ),
          Padding(
            padding: theme.titlePadding,
            child: Text(
              widget.title,
              style: context.tokens.textStyles.sectionHeading2Medium,
            ),
          ),
        ],
      ),
    );
  }
}
