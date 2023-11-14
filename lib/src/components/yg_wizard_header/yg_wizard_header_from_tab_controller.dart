part of 'yg_wizard_header.dart';

class _YgWizardHeaderFromTabController extends YgWizardHeader {
  const _YgWizardHeaderFromTabController({
    required super.buildCounter,
    required super.title,
    required this.controller,
  }) : super._();

  final TabController controller;

  @override
  State<StatefulWidget> createState() => _YgWizardHeaderStateFromTabController();
}

class _YgWizardHeaderStateFromTabController extends _YgWizardHeaderState<_YgWizardHeaderFromTabController> {
  @override
  Animation<double> get _valueAnimation => widget.controller.animation!;

  @override
  int get _steps => widget.controller.length;

  @override
  int get _step => _valueAnimation.value.round();
}
