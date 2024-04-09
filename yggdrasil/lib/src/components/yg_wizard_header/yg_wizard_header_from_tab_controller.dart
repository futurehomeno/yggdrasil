part of 'yg_wizard_header.dart';

class _YgWizardHeaderFromTabController extends YgWizardHeader {
  const _YgWizardHeaderFromTabController({
    required super.titleBuilder,
    this.controller,
  }) : super._();

  /// Controls the animations and value of this [YgWizardHeader].
  ///
  /// !--- IMPORTANT ---
  /// When not provided this will use [DefaultTabController.of] instead but this
  /// will throw when no [DefaultTabController] is in the widget tree.
  final TabController? controller;

  @override
  State<StatefulWidget> createState() => _YgWizardHeaderStateFromTabController();
}

class _YgWizardHeaderStateFromTabController extends _YgWizardHeaderState<_YgWizardHeaderFromTabController> {
  TabController get _controller {
    final TabController? controller = widget.controller;

    if (controller != null) {
      return controller;
    }

    return DefaultTabController.of(context);
  }

  @override
  Animation<double> get _valueAnimation => _controller.animation!;

  @override
  int get _steps => _controller.length;

  @override
  int get _step => _valueAnimation.value.round();
}
