part of 'yg_debug.dart';

class _YgDebugRenderBox extends YgDebug {
  const _YgDebugRenderBox({
    super.key,
    required super.child,
    super.type = YgDebugType.other,
  }) : super._();

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _YgDebugRenderBoxChild(
      type: type,
    );
  }

  @override
  void updateRenderObject(BuildContext context, covariant _YgDebugRenderBoxChild renderObject) {
    renderObject.type = type;
    super.updateRenderObject(context, renderObject);
  }
}

class _YgDebugRenderBoxChild extends RenderProxyBox with YgRenderObjectDebugPainterMixin {
  _YgDebugRenderBoxChild({
    required YgDebugType type,
  }) {
    this.type = type;
  }
}
