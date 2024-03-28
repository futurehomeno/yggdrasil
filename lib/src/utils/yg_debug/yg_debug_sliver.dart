part of 'yg_debug.dart';

/// A design debugging widget.
///
/// Provides debugging outlines for designers which indicate the bounds of every
/// custom widget we implement.
class _YgDebugSliver extends YgDebug {
  const _YgDebugSliver({
    super.key,
    required super.child,
    super.type = YgDebugType.other,
  }) : super._();

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _YgDebugSliverChild(
      type: type,
    );
  }

  @override
  void updateRenderObject(BuildContext context, covariant _YgDebugSliverChild renderObject) {
    renderObject.type = type;
    super.updateRenderObject(context, renderObject);
  }
}

class _YgDebugSliverChild extends RenderProxySliver with YgRenderObjectDebugPainterMixin {
  _YgDebugSliverChild({
    required YgDebugType type,
  }) {
    this.type = type;
  }
}
