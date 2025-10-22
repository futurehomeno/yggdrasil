part of 'yg_wizard_header.dart';

class _YgWizardHeaderFromPageController extends YgWizardHeader {
  const _YgWizardHeaderFromPageController({
    required super.titleBuilder,
    required this.controller,
    required this.steps,
  }) : super._();

  /// Controls the animations and value of this [YgWizardHeader].
  final PageController controller;

  /// The amount of steps.
  ///
  /// Shows a progress bar with up to 5 steps, when there are more than 5 steps
  /// only the counter is shown.
  final int steps;

  @override
  State<StatefulWidget> createState() => _YgWizardHeaderStateFromPageController();
}

class _YgWizardHeaderStateFromPageController extends _YgWizardHeaderState<_YgWizardHeaderFromPageController> {
  @override
  Animation<double> get _valueAnimation => _PageControllerAnimation(
    parent: widget.controller,
  );

  @override
  int get _steps => widget.steps;

  @override
  int get _step => _valueAnimation.value.round();
}

class _PageControllerAnimation extends Animation<double> {
  const _PageControllerAnimation({
    required this.parent,
  });

  final PageController parent;

  @override
  void addListener(VoidCallback listener) {
    parent.addListener(listener);
  }

  @override
  void addStatusListener(AnimationStatusListener listener) {}

  @override
  void removeListener(VoidCallback listener) {
    parent.removeListener(listener);
  }

  @override
  void removeStatusListener(AnimationStatusListener listener) {}

  @override
  AnimationStatus get status => AnimationStatus.completed;

  @override
  double get value {
    if (parent.positions.isEmpty) {
      return parent.initialPage.toDouble();
    }

    return parent.page ?? 0;
  }

  @override
  bool operator ==(Object other) => other is _PageControllerAnimation && other.parent == parent;

  @override
  int get hashCode => parent.hashCode;
}
