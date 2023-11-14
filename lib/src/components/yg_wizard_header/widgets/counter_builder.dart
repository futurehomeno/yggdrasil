import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/_theme.dart';

import '../_yg_wizard_header.dart';

/// Builds the current step counter.
///
/// Only calls [buildCounter] when the step or steps values actually change.
class CounterBuilder extends StatefulWidget {
  const CounterBuilder({
    super.key,
    required this.animation,
    required this.getStep,
    required this.getSteps,
    required this.buildCounter,
  });

  /// The animation used to check if the values changed.
  final Animation<double> animation;

  /// Gets the current step.
  final int Function() getStep;

  /// Gets the current total amount of steps.
  final int Function() getSteps;

  /// Builds the counter.
  final CounterBuilderCallback buildCounter;

  @override
  State<CounterBuilder> createState() => _CounterBuilderState();
}

class _CounterBuilderState extends State<CounterBuilder> {
  /// The current step.
  late int _step;

  /// The current total steps.
  late int _steps;

  @override
  void initState() {
    super.initState();
    widget.animation.addListener(_checkForRebuild);
    _step = widget.getStep();
    _steps = widget.getSteps();
  }

  @override
  void didUpdateWidget(covariant CounterBuilder oldWidget) {
    if (oldWidget.animation != widget.animation) {
      oldWidget.animation.removeListener(_checkForRebuild);
      widget.animation.addListener(_checkForRebuild);
    }
    _step = widget.getStep();
    _steps = widget.getSteps();
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    widget.animation.removeListener(_checkForRebuild);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      widget.buildCounter(
        _step + 1,
        _steps,
      ),
      style: context.wizardHeaderTheme.counterTextStyle,
    );
  }

  void _checkForRebuild() {
    final int newStep = widget.getStep();
    final int newSteps = widget.getSteps();

    final bool stepChanged = newStep != _step;
    final bool stepsChanged = newSteps != _steps;

    if (stepChanged) {
      _step = newStep;
    }
    if (stepsChanged) {
      _steps = newSteps;
    }

    if (stepChanged || stepsChanged) {
      setState(() {});
    }
  }
}
