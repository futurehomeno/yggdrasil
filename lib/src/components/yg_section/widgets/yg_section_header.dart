part of '../yg_section.dart';

class _YgSectionHeader extends StatelessWidget {
  const _YgSectionHeader({
    required this.title,
    this.subtitle,
    this.trailing,
  });

  final String title;
  final String? subtitle;
  final List<Widget>? trailing;

  @override
  Widget build(BuildContext context) {
    final String? subtitle = this.subtitle;
    final List<Widget>? trailing = this.trailing;

    return Padding(
      padding: context.sectionTheme.sectionHeader.padding,
      child: Row(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                title,
                style: context.sectionTheme.sectionHeader.titleTextStyle,
              ),
              if (subtitle != null)
                Text(
                  subtitle,
                  style: context.sectionTheme.sectionHeader.subtitleTextStyle,
                ),
            ],
          ),
          if (trailing != null) ...trailing,
        ].withHorizontalSpacing(10.0),
      ),
    );
  }
}
