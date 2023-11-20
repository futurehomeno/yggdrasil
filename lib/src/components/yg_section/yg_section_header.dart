part of 'yg_section.dart';

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
      child: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Expanded(
                  child: Text(
                    title,
                    style: context.sectionTheme.sectionHeader.titleTextStyle,
                  ),
                ),
                if (trailing != null)
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: trailing.withHorizontalSpacing(10.0),
                  ),
              ].withHorizontalSpacing(10.0),
            ),
            if (subtitle != null)
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Text(
                  subtitle,
                  style: context.sectionTheme.sectionHeader.subtitleTextStyle,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
