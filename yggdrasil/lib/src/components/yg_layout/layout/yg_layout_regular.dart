part of 'yg_layout.dart';

class YgLayoutRegular extends YgLayout {
  const YgLayoutRegular({
    super.key,
    required this.child,
    super.appBar,
    super.trailing,
    super.headerBehavior,
  }) : super._();

  final Widget child;

  @override
  State<YgLayout> createState() => YgLayoutRegularState();
}

class YgLayoutRegularState extends _YgLayoutState<YgLayoutRegular> {
  @override
  Widget build(BuildContext context) {
    return YgLayoutInternal(
      controller: _controller,
      headerBehavior: widget.headerBehavior,
      appBar: widget.appBar,
      trailing: widget.trailing,
      content: YgLayoutHeaderControllerProvider(
        controller: _controller,
        index: 0,
        child: widget.child,
      ),
    );
  }
}
