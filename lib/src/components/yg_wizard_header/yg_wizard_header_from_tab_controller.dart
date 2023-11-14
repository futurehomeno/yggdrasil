part of 'yg_wizard_header.dart';

class _YgWizardHeaderFromTabController extends YgWizardHeader {
  const _YgWizardHeaderFromTabController({
    required super.counterBuilder,
    required super.title,
    required this.controller,
  }) : super._();

  /// Controls the animations and value of this [YgWizardHeader].
  final TabController controller;

  @override
  State<StatefulWidget> createState() => _YgWizardHeaderStateFromTabController();
}

class _YgWizardHeaderStateFromTabController extends _YgWizardHeaderState<_YgWizardHeaderFromTabController> {
  @override
  Animation<double> get _valueAnimation => widget.controller.animation!;

  @override
  int _getSteps() => widget.controller.length;

  @override
  int _getStep() => _valueAnimation.value.round();
}
