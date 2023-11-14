part of 'yg_wizard_header.dart';

class _YgWizardHeaderFromTabController extends YgWizardHeader {
  const _YgWizardHeaderFromTabController({
    required super.counterBuilder,
    required super.titleBuilder,
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
  int get _steps => widget.controller.length;

  @override
  int get _step => _valueAnimation.value.round();
}
