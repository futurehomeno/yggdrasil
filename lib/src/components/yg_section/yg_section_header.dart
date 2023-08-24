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
      padding: context.sectionTheme.sectionHeader.padding,
      child: Column(
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
    );
  }
}
