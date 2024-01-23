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
  // ignore: library_private_types_in_public_api
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

  @override
  void paint(
    PaintingContext context,
    Offset offset,
  ) {
    final RenderSliver? child = this.child;

    if (child == null) {
      return;
    }

    // We always first draw the child.
    context.paintChild(child, offset);

    if (isDebuggingToggled()) {
      final Size size = getAbsoluteSize();

      paintYgDebug(
        context: context,
        offset: offset,
        size: size,
      );
    }
  }
}
