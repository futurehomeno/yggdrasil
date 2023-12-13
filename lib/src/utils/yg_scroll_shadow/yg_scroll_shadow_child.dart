part of 'yg_scroll_shadow.dart';

class _YgScrollShadowChild extends YgScrollShadow {
  const _YgScrollShadowChild({
    required this.child,
    required super.controller,
  }) : super._();

  final Widget child;

  @override
  Widget builder(BuildContext context, ScrollController controller) {
    return child;
  }
}
