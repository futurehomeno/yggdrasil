part of 'yg_tag.dart';

class _YgTagWithTrailingIconChild extends StatelessWidget {
  const _YgTagWithTrailingIconChild({
    required this.icon,
    required this.child,
  });

  final YgIcon icon;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Flexible(child: child),
        icon,
      ].withHorizontalSpacing(context.tagTheme.iconSpacing),
    );
  }
}
