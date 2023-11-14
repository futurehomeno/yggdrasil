part of 'yg_button.dart';

class _YgButtonWithLeadingIconChild extends StatelessWidget {
  const _YgButtonWithLeadingIconChild({
    required this.icon,
    required this.child,
  });

  final YgColorableIconData icon;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        YgIcon(icon),
        Flexible(child: child),
      ].withHorizontalSpacing(context.buttonTheme.iconSpacing),
    );
  }
}
