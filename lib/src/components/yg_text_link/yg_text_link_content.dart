part of 'yg_text_link.dart';

class YgTextLinkContent extends StatelessWidget {
  const YgTextLinkContent({
    required this.text,
    required this.external,
  });

  final String text;
  final bool external;

  @override
  Widget build(BuildContext context) {
    final YgTextLinkTheme theme = context.textLinkTheme;

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Flexible(
          child: Text(text),
        ),
        if (external)
          Padding(
            padding: theme.iconPadding,
            child: YgIcon(
              YgIcons.link,
              color: theme.iconColor,
              size: YgIconSize.small,
            ),
          ),
      ],
    );
  }
}
