part of 'yg_button.dart';

class _YgButtonWithTrailingIconChild extends StatelessWidget {
  const _YgButtonWithTrailingIconChild({
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
        Flexible(child: child),
        YgIcon(colorableIconData),
      ].withHorizontalSpacing(context.buttonTheme.iconSpacing),
    );
  }
}
