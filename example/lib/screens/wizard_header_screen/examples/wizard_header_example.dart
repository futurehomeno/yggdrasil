import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

import '../widgets/_widgets.dart';

class WizardHeaderExample extends StatefulWidget {
  const WizardHeaderExample({
    super.key,
    required this.steps,
    required this.title,
  });

  final int steps;
  final String title;

  @override
  State<WizardHeaderExample> createState() => _WizardHeaderExampleState();
}

class _WizardHeaderExampleState extends State<WizardHeaderExample> {
  int _step = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        YgWizardHeader(
          titleBuilder: (_) => widget.title,
          counterBuilder: (int p0, int p1) => 'Step $p0 of $p1',
          step: _step,
          steps: widget.steps,
        ),
        StepNavigator(
          onNext: _nextStep,
          onPrevious: _previousStep,
          step: _step,
          steps: widget.steps,
        ),
      ],
    );
  }

  void _previousStep() {
    _step--;
    setState(() {});
  }

  void _nextStep() {
    _step++;
    setState(() {});
  }
}
