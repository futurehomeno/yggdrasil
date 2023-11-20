part of 'yg_section.dart';

class _YgSectionHeader extends StatelessWidget {
  const _YgSectionHeader({
    required this.title,
    this.subtitle,
    this.trailing,
    this.icon,
  });

  final String title;
  final String? subtitle;
  final List<Widget>? trailing;
  final YgIcon? icon;

  @override
  Widget build(BuildContext context) {
    final String? subtitle = this.subtitle;
    final List<Widget>? trailing = this.trailing;
    final YgIcon? icon = this.icon;
    final YgSectionHeaderTheme theme = context.sectionTheme.sectionHeader;

    return Padding(
      padding: theme.padding,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (icon != null)
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: icon,
            ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        title,
                        style: theme.titleTextStyle,
                      ),
                    ),
                    if (trailing != null) ...trailing,
                  ].withHorizontalSpacing(10.0),
                ),
                if (subtitle != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Text(
                      subtitle,
                      style: theme.subtitleTextStyle,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
