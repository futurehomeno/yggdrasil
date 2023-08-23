part of 'yg_tag.dart';

class _YgTagWithLeadingIconChild extends StatelessWidget {
  const _YgTagWithLeadingIconChild({
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
        icon,
        Flexible(child: child),
      ].withHorizontalSpacing(context.tagTheme.iconSpacing),
    );
  }
}
