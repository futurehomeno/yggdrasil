import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/_theme.dart';

import 'wizard_progress_painter.dart';

part 'yg_wizard_header_from_tab_controller.dart';
part 'yg_wizard_header_regular.dart';

abstract class YgWizardHeader extends StatefulWidget {
  /// Self animated YgWizardHeader.
  ///
  /// Animates the [step] value. Changing the amount of steps is not animated.
  const factory YgWizardHeader({
    required String Function(int, int) buildCounter,
    required int step,
    required int steps,
    required String title,
  }) = _YgWizardHeaderRegular;

  /// YgWizardHeader controlled by a TabController.
  ///
  /// Animates the current step together with the tabs.
  const factory YgWizardHeader.fromTabController({
    required String Function(int, int) buildCounter,
    required TabController controller,
    required String title,
  }) = _YgWizardHeaderFromTabController;

  const YgWizardHeader._({
    required this.buildCounter,
    required this.title,
  });

  /// The title of the Wizard header.
  final String title;

  /// Builds the current counter.
  ///
  /// Gets passed the current step and the total amount of steps.
  final String Function(int step, int steps) buildCounter;
}

abstract class _YgWizardHeaderState<W extends YgWizardHeader> extends State<W> with TickerProviderStateMixin {
  Animation<double> get _valueAnimation;
  int get _steps;
  int get _step;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.tokens.colors.backgroundDefault,
      padding: const EdgeInsets.only(
        bottom: 10,
        top: 20,
        left: 20,
        right: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              if (_steps < 6)
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: SizedBox(
                      height: 4,
                      child: CustomPaint(
                        painter: WizardProgressPainter(
                          steps: _steps,
                          value: _valueAnimation,
                          stroke: 4,
                          padding: 5,
                        ),
                      ),
                    ),
                  ),
                ),
              AnimatedBuilder(
                animation: _valueAnimation,
                builder: (BuildContext context, _) {
                  return Text(
                    widget.buildCounter(
                      (1 + _step).round(),
                      _steps,
                    ),
                  );
                },
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            widget.title,
            style: context.tokens.textStyles.sectionHeading2Medium,
          ),
        ],
      ),
    );
  }
}
