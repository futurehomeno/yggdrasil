import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

class StepNavigator extends StatelessWidget {
  const StepNavigator({
    super.key,
    required this.onNext,
    required this.onPrevious,
    required this.step,
    required this.steps,
  });

  final VoidCallback onNext;
  final VoidCallback onPrevious;
  final int step;
  final int steps;

  @override
  Widget build(BuildContext context) {
    return YgSection.base(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          YgButton(
            onPressed: step < 1 ? null : onPrevious,
            child: const Text('Previous step'),
          ),
          Text('Step ${step + 1}'),
          YgButton(
            onPressed: step < steps - 1 ? onNext : null,
            child: const Text('Next step'),
          ),
        ],
      ),
    );
  }
}
