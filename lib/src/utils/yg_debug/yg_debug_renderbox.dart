part of 'yg_debug.dart';

class _YgDebugRenderBox extends YgDebug {
  const _YgDebugRenderBox({
    super.key,
    required super.child,
    super.type = YgDebugType.other,
  }) : super._();

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _YgDebugChild(
      type: type,
    );
  }

  @override
  // ignore: library_private_types_in_public_api
  void updateRenderObject(BuildContext context, covariant _YgDebugChild renderObject) {
    renderObject.type = type;
    super.updateRenderObject(context, renderObject);
  }
}

class _YgDebugChild extends RenderProxyBox with YgDebugPainter {
  _YgDebugChild({
    required YgDebugType type,
  }) {
    this.type = type;
  }

  @override
  void paint(
    PaintingContext context,
    Offset offset,
  ) {
    final RenderBox? child = this.child;

    if (child == null) {
      return;
    }

    // We always first draw the child.
    context.paintChild(child, offset);
  }
}
