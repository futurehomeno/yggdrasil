part of 'yg_tag.dart';

class _YgTagWithDoubleIconChild extends StatelessWidget {
  const _YgTagWithDoubleIconChild({
    required this.leadingIcon,
    required this.trailingIcon,
    required this.child,
  });

  final YgIcon leadingIcon;
  final YgIcon trailingIcon;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        leadingIcon,
        Flexible(child: child),
        trailingIcon,
      ].withHorizontalSpacing(context.tagTheme.iconSpacing),
    );
  }
}
