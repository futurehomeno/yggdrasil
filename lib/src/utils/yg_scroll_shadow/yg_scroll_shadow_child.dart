part of 'yg_scroll_shadow.dart';

class _YgScrollShadowChild extends YgScrollShadow {
  const _YgScrollShadowChild({
    Key? key,
    required this.child,
    required ScrollController controller,
  }) : super._(
          controller: controller,
          key: key,
        );

  final Widget child;

  @override
  Widget builder(BuildContext context, ScrollController controller) {
    return child;
  }
}
