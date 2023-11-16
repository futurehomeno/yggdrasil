import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

/// Widget to simplify the wizard header examples.
///
/// Disables next and previous buttons when at the max or min step.
class StepNavigator extends StatelessWidget {
  const StepNavigator({
    super.key,
    required this.onNext,
    required this.onPrevious,
    required this.currentStep,
    required this.steps,
  });

  final VoidCallback onNext;
  final VoidCallback onPrevious;
  final int currentStep;
  final int steps;

  @override
  Widget build(BuildContext context) {
    return YgSection.base(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          YgButton(
            onPressed: currentStep < 1 ? null : onPrevious,
            child: const Text('Previous step'),
          ),
          Text('Step ${currentStep + 1}'),
          YgButton(
            onPressed: currentStep < steps - 1 ? onNext : null,
            child: const Text('Next step'),
          ),
        ],
      ),
    );
  }
}
