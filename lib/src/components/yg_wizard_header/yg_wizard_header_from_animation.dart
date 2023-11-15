part of 'yg_wizard_header.dart';

class _YgWizardHeaderFromAnimation extends YgWizardHeader {
  const _YgWizardHeaderFromAnimation({
    required super.counterBuilder,
    required super.titleBuilder,
    required this.animation,
    required this.steps,
  }) : super._();

  /// Controls the animations and value of this [YgWizardHeader].
  final Animation<double> animation;

  final int steps;

  @override
  State<StatefulWidget> createState() => _YgWizardHeaderStateFromAnimation();
}

class _YgWizardHeaderStateFromAnimation extends _YgWizardHeaderState<_YgWizardHeaderFromAnimation> {
  @override
  Animation<double> get _valueAnimation => widget.animation;

  @override
  int get _steps => widget.steps;

  @override
  int get _step => _valueAnimation.value.round();
}
