import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/section/extensions/section_header_theme.dart';
import 'package:yggdrasil/yggdrasil.dart';

class YgSectionHeader extends StatelessWidget {
  const YgSectionHeader({
    super.key,
    required this.title,
    this.subtitle,
    this.trailing,
    this.icon,
  });

  /// The title of the section.
  final String title;

  /// The subtitle of the section.
  final String? subtitle;

  /// The widgets trailing the title.
  final List<Widget>? trailing;

  /// The icon in front of the title and subtitle.
  final YgIcon? icon;

  @override
  Widget build(BuildContext context) {
    final YgSectionHeaderTheme theme = context.sectionTheme.sectionHeader;
    final List<Widget>? trailing = this.trailing;
    final String? subtitle = this.subtitle;
    final YgIcon? icon = this.icon;

    return Padding(
      padding: theme.padding,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (icon != null)
            Padding(
              padding: theme.iconPadding,
              child: icon,
            ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        title,
                        style: theme.titleTextStyle,
                      ),
                    ),
                    if (trailing != null) ...trailing,
                  ].withHorizontalSpacing(theme.trailingSpacing),
                ),
                if (subtitle != null)
                  Padding(
                    padding: theme.subtitlePadding,
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
