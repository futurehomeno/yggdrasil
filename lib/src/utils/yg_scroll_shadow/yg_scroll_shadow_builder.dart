part of 'yg_scroll_shadow.dart';

class _YgScrollShadowBuilder extends YgScrollShadow {
  const _YgScrollShadowBuilder({
    required WidgetWithScrollBuilder builder,
  })  : _builder = builder,
        super._();

  final WidgetWithScrollBuilder _builder;

  @override
  Widget builder(BuildContext context, ScrollController controller) {
    return _builder(context, controller);
  }
}
