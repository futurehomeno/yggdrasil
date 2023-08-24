part of 'yg_section.dart';

class _YgSectionHeader extends StatelessWidget {
  const _YgSectionHeader({
    required this.title,
    this.subtitle,
  });

  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    final String? subtitle = this.subtitle;

    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: <Widget>[
          Text(
            title,
            style: context.sectionTheme.sectionTileTheme.titleTextStyle,
          ),
          if (subtitle != null)
            Text(
              subtitle,
              style: context.sectionTheme.sectionTileTheme.subtitleTextStyle,
            ),
        ],
      ),
    );
  }
}
