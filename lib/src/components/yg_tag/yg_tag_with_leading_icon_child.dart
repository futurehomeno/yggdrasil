part of 'yg_tag.dart';

class YgTagWithLeadingIconChild extends StatelessWidget {
  const YgTagWithLeadingIconChild({
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
