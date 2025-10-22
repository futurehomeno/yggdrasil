part of 'yg_dropdown_menu_route.dart';

// TODO(DEV-1917): Make it so this gets updated if the followed widget changes.
class _YgDropdownMenuPositioner extends SingleChildRenderObjectWidget {
  const _YgDropdownMenuPositioner({
    required super.child,
    required this.rect,
    required this.animation,
    required this.padding,
  });

  final Animation<double> animation;
  final Rect rect;
  final double padding;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _YgDropdownMenuPositionerRenderObject(
      rect: rect,
      animation: animation,
      screenPadding: MediaQuery.paddingOf(context),
      padding: padding,
    );
  }

  @override
  void updateRenderObject(
    BuildContext context,
    covariant _YgDropdownMenuPositionerRenderObject renderObject,
  ) {
    renderObject.rect = rect;
    renderObject.animation = animation;
    renderObject.screenPadding = MediaQuery.paddingOf(context);
    renderObject.padding = padding;
  }
}

class _YgDropdownMenuPositionerRenderObject extends RenderBox with RenderObjectWithChildMixin<RenderBox> {
  _YgDropdownMenuPositionerRenderObject({
    required Rect rect,
    required Animation<double> animation,
    required EdgeInsets screenPadding,
    required double padding,
  }) : _parentRect = rect,
       _animation = animation,
       _padding = padding,
       _screenPadding = screenPadding;

  late Offset _offset;

  EdgeInsets _screenPadding;
  EdgeInsets get screenPadding => _screenPadding;
  set screenPadding(EdgeInsets padding) {
    if (_screenPadding != padding) {
      _screenPadding = padding;
      markNeedsLayout();
    }
  }

  Rect _parentRect;
  Rect get rect => _parentRect;
  set rect(Rect value) {
    if (_parentRect != value) {
      _parentRect = value;
      markNeedsLayout();
    }
  }

  Animation<double> _animation;
  Animation<double> get animation => _animation;
  set animation(Animation<double> animation) {
    if (_animation != animation) {
      _animation.removeListener(markNeedsLayout);
      _animation = animation;
      _animation.addListener(markNeedsLayout);
    }
  }

  double _padding;
  double get padding => _padding;
  set padding(double padding) {
    if (_padding != padding) {
      _padding = padding;
      markNeedsLayout();
    }
  }

  @override
  void attach(PipelineOwner owner) {
    super.attach(owner);
    _animation.addListener(markNeedsLayout);
  }

  @override
  void detach() {
    _animation.removeListener(markNeedsLayout);
    super.detach();
  }

  @override
  void performLayout() {
    final RenderBox? child = this.child;

    if (child == null) {
      return;
    }

    final double spaceToScreenBottom =
        constraints.maxHeight - _parentRect.bottom - screenPadding.bottom - (padding * 2);
    final double spaceToScreenTop = _parentRect.top - screenPadding.top - (padding * 2);
    final double maxHeight = max(spaceToScreenTop, spaceToScreenBottom);

    final Size targetSize = child.getDryLayout(
      BoxConstraints(
        maxHeight: maxHeight,
        maxWidth: _parentRect.width,
        minWidth: _parentRect.width,
      ),
    );

    child.layout(
      BoxConstraints(
        maxHeight: targetSize.height * animation.value,
        maxWidth: _parentRect.width,
        minWidth: _parentRect.width,
      ),
      parentUsesSize: true,
    );

    // Since the child is constrained to either the top or bottom, if it's more
    // than bottom, it has to be top.
    _offset = Offset(
      _parentRect.left,
      targetSize.height > spaceToScreenBottom
          ? _parentRect.top - child.size.height - padding
          : _parentRect.bottom + padding,
    );

    size = Size(
      constraints.maxWidth,
      constraints.maxHeight,
    );
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final RenderBox? child = this.child;

    if (child == null) {
      return;
    }

    child.paint(context, _offset);
  }

  @override
  bool hitTestChildren(BoxHitTestResult result, {required Offset position}) {
    final RenderBox? child = this.child;

    if (child == null) {
      return false;
    }

    return child.hitTest(
      result,
      position: position - _offset,
    );
  }
}
