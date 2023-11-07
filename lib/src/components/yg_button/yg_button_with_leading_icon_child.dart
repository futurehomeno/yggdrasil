part of 'yg_button.dart';

class _YgButtonWithLeadingIconChild extends StatelessWidget {
  const _YgButtonWithLeadingIconChild({
    required this.colorableIconData,
    required this.child,
    this.iconColor,
  });

  final YgColorableIconData colorableIconData;
  final Widget child;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        YgIcon(
          colorableIconData,
          color: iconColor,
        ),
        Flexible(child: child),
      ].withHorizontalSpacing(context.buttonTheme.iconSpacing),
    );
  }
}
