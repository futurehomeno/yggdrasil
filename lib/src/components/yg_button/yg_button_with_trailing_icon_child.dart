part of 'yg_button.dart';

class _YgButtonWithTrailingIconChild extends StatelessWidget {
  const _YgButtonWithTrailingIconChild({
    required this.icon,
    required this.child,
    this.iconColor,
  });

  final YgColorableIconData icon;
  final Widget child;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Flexible(child: child),
        YgIcon(icon),
      ].withHorizontalSpacing(context.buttonTheme.iconSpacing),
    );
  }
}
