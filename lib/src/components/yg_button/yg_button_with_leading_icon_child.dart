part of 'yg_button.dart';

class YgButtonWithLeadingIconChild extends StatelessWidget {
  const YgButtonWithLeadingIconChild({
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
      ].withHorizontalSpacing(context.buttonTheme.iconSpacing),
    );
  }
}
