part of 'yg_layout.dart';

/// A layout with a single child.
class _YgLayoutRegular extends YgLayout {
  const _YgLayoutRegular({
    super.key,
    required this.child,
    super.appBar,
    super.bottom,
    super.headerBehavior,
  }) : super._();

  /// The child shown in the current layout.
  final Widget child;

  @override
  State<YgLayout> createState() => _YgLayoutRegularState();
}

class _YgLayoutRegularState extends _YgLayoutState<_YgLayoutRegular> {
  @override
  Widget build(BuildContext context) {
    return YgLayoutInternal(
      controller: _controller,
      headerBehavior: widget.headerBehavior,
      appBar: widget.appBar,
      bottom: widget.bottom,
      content: YgLayoutHeaderControllerProvider(
        controller: _controller,
        index: 0,
        child: widget.child,
      ),
    );
  }
}
