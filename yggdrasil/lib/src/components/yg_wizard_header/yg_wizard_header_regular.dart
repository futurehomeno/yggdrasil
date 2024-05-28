part of 'yg_wizard_header.dart';

class _YgWizardHeaderRegular extends YgWizardHeader {
  const _YgWizardHeaderRegular({
    required super.titleBuilder,
    required this.currentStep,
    required this.steps,
  })  : assert(
          currentStep < steps,
          'currentStep has to be less than steps',
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
  final int currentStep;

  @override
  State<StatefulWidget> createState() => _YgWizardHeaderStateRegular();
}

class _YgWizardHeaderStateRegular extends _YgWizardHeaderState<_YgWizardHeaderRegular> {
  @override
  late final AnimationController _valueAnimation = AnimationController.unbounded(
    value: widget.currentStep.toDouble(),
    vsync: this,
  );

  @override
  int get _steps => widget.steps;

  @override
  int get _step => widget.currentStep;

  @override
  void didUpdateWidget(covariant _YgWizardHeaderRegular oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.steps != oldWidget.steps) {
      _valueAnimation.value = widget.currentStep.toDouble();
    } else if (widget.currentStep != oldWidget.currentStep) {
      final YgWizardHeaderTheme theme = context.wizardHeaderTheme;

      _valueAnimation.animateTo(
        widget.currentStep.toDouble(),
        curve: theme.animationCurve,
        duration: theme.animationDuration,
      );
    }
  }

  @override
  void dispose() {
    _valueAnimation.dispose();
    super.dispose();
  }
}
