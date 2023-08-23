part of 'yg_button.dart';

class YgButtonWithTrailingIconChild extends StatelessWidget {
  const YgButtonWithTrailingIconChild({
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
      ].withHorizontalSpacing(context.buttonTheme.iconSpacing),
    );
  }
}
