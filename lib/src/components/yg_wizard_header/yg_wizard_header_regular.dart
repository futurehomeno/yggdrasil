part of 'yg_wizard_header.dart';

class _YgWizardHeaderRegular extends YgWizardHeader {
  const _YgWizardHeaderRegular({
    required super.counterBuilder,
    required super.title,
    required this.step,
    required this.steps,
  })  : assert(
          step < steps,
          'step has to be less than steps',
        ),
        assert(
          steps > 1,
          'Wizard header must have at least 2 steps',
        ),
        super._();

  /// The amount of steps.
  ///
  /// Shows a progress bar with up to 5 steps, when there are more than 5 steps
  /// only the counter is shown.
  final int steps;

  /// The current step.
  final int step;

  @override
  State<StatefulWidget> createState() => _YgWizardHeaderStateRegular();
}

class _YgWizardHeaderStateRegular extends _YgWizardHeaderState<_YgWizardHeaderRegular> {
  @override
  late final AnimationController _valueAnimation = AnimationController.unbounded(
    value: widget.step.toDouble(),
    vsync: this,
  );

  @override
  int _getSteps() => widget.steps;

  @override
  int _getStep() => widget.step;

  @override
  void didUpdateWidget(covariant _YgWizardHeaderRegular oldWidget) {
    if (widget.steps != oldWidget.steps) {
      _valueAnimation.value = widget.step.toDouble();
    } else if (widget.step != oldWidget.step) {
      final YgWizardHeaderTheme theme = context.wizardHeaderTheme;

      _valueAnimation.animateTo(
        widget.step.toDouble(),
        curve: theme.animationCurve,
        duration: theme.animationDuration,
      );
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _valueAnimation.dispose();
    super.dispose();
  }
}
