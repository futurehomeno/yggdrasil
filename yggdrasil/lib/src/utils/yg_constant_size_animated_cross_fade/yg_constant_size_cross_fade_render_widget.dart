part of 'yg_constant_size_animated_cross_fade.dart';

/// Animates between 2 widgets while maintaining the size of the largest widget.
///
/// Allows you to individually align both child widgets.
class _YgConstantSizeCrossFadeRenderWidget extends MultiChildRenderObjectWidget {
  _YgConstantSizeCrossFadeRenderWidget({
    super.key,
    required Widget firstChild,
    required this.firstChildAlignment,
    required Widget secondChild,
    required this.secondChildAlignment,
    required this.animation,
  }) : super(
          children: <Widget>[
            firstChild,
            secondChild,
          ],
        );

  final Alignment firstChildAlignment;
  final Alignment secondChildAlignment;
  final Animation<double> animation;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _YgConstantSizeCrossFadeRenderer(
      firstChildAlignment: firstChildAlignment,
      secondChildAlignment: secondChildAlignment,
      animation: animation,
    );
  }

  @override
  void updateRenderObject(BuildContext context, covariant _YgConstantSizeCrossFadeRenderer renderObject) {
    renderObject.firstChildAlignment = firstChildAlignment;
    renderObject.secondChildAlignment = secondChildAlignment;
    renderObject.animation = animation;
  }
}

class _YgConstantSizeCrossFadeRendererParentData extends ContainerBoxParentData<RenderBox> {}

class _YgConstantSizeCrossFadeRenderer extends RenderBox
    with
        ContainerRenderObjectMixin<RenderBox, _YgConstantSizeCrossFadeRendererParentData>,
        RenderBoxContainerDefaultsMixin<RenderBox, _YgConstantSizeCrossFadeRendererParentData> {
  _YgConstantSizeCrossFadeRenderer({
    required Alignment firstChildAlignment,
    required Alignment secondChildAlignment,
    required Animation<double> animation,
  })  : _firstChildAlignment = firstChildAlignment,
        _secondChildAlignment = secondChildAlignment,
        _animation = animation;

  Alignment _firstChildAlignment;
  Alignment get firstChildAlignment => _firstChildAlignment;
  set firstChildAlignment(Alignment newAlignment) {
    if (newAlignment != _firstChildAlignment) {
      markNeedsPaint();
      _firstChildAlignment = newAlignment;
    }
  }

  Alignment _secondChildAlignment;
  Alignment get secondChildAlignment => _secondChildAlignment;
  set secondChildAlignment(Alignment newAlignment) {
    if (newAlignment != _secondChildAlignment) {
      markNeedsPaint();
      _secondChildAlignment = newAlignment;
    }
  }

  Animation<double> _animation;
  Animation<double> get animation => _animation;
  set animation(Animation<double> newAnimation) {
    if (newAnimation == _animation) {
      return;
    }

    if (attached) {
      _animation.removeListener(markNeedsPaint);
      _animation = newAnimation;
      _animation.addListener(markNeedsPaint);
    } else {
      _animation = newAnimation;
    }
  }

  @override
  void attach(PipelineOwner owner) {
    _animation.addListener(markNeedsPaint);
    super.attach(owner);
  }

  @override
  void detach() {
    _animation.removeListener(markNeedsPaint);
    super.detach();
  }

  @override
  void setupParentData(covariant RenderObject child) {
    child.parentData = _YgConstantSizeCrossFadeRendererParentData();
  }

  @override
  void performLayout() {
    final RenderBox? firstChild = this.firstChild;
    final RenderBox? secondChild = lastChild;

    if (firstChild == null || secondChild == null) {
      return;
    }

    final BoxConstraints childConstraints = BoxConstraints.loose(
      constraints.biggest,
    );

    firstChild.layout(
      childConstraints,
      parentUsesSize: true,
    );
    secondChild.layout(
      childConstraints,
      parentUsesSize: true,
    );

    size = Size(
      max(firstChild.size.width, secondChild.size.width),
      max(firstChild.size.height, secondChild.size.height),
    );
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final RenderBox? firstChild = this.firstChild;
    final RenderBox? secondChild = lastChild;

    if (firstChild == null || secondChild == null) {
      return;
    }

    final Rect outerRect = offset & size;

    // should paint 1st child
    if (_animation.value < 1) {
      final Offset offset = firstChildAlignment.inscribe(firstChild.size, outerRect).topLeft;

      if (_animation.value == 0) {
        context.paintChild(firstChild, offset);
      } else {
        context.pushOpacity(
          offset,
          ((1 - _animation.value) * 255).toInt(),
          firstChild.paint,
        );
      }
    }

    // should paint 2nd child
    if (_animation.value > 0) {
      final Offset offset = secondChildAlignment.inscribe(secondChild.size, outerRect).topLeft;

      if (_animation.value == 1) {
        context.paintChild(secondChild, offset);
      } else {
        context.pushOpacity(
          offset,
          (_animation.value * 255).toInt(),
          secondChild.paint,
        );
      }
    }
  }
}
