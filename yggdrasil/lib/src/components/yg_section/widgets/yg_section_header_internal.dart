import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_section/widgets/_widgets.dart';
import 'package:yggdrasil/src/theme/section/extensions/section_header_theme.dart';
import 'package:yggdrasil/yggdrasil.dart';

class YgSectionHeaderInternal extends StatelessWidget {
  const YgSectionHeaderInternal({
    super.key,
    required this.title,
    this.subtitle,
    this.trailing,
    this.tag,
    this.icon,
  });

  /// The title of the section.
  final String title;

  /// The subtitle of the section.
  final String? subtitle;

  /// The widget trailing the title and tag.
  final Widget? trailing;

  // TODO(DEV-3018): Rework interface so this is no longer called tag. Probably
  // should accept a list of widgets for trailing.
  /// The tag.
  final Widget? tag;

  /// The icon in front of the title and subtitle.
  final YgIconData? icon;

  @override
  Widget build(BuildContext context) {
    final YgSectionHeaderTheme theme = context.sectionTheme.sectionHeader;
    final String? subtitle = this.subtitle;
    final YgIconData? icon = this.icon;
    final Widget? tag = this.tag;
    final Widget? trailing = this.trailing;

    return Padding(
      padding: theme.padding,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (icon != null)
            Padding(
              padding: theme.iconPadding,
              child: YgIcon(icon),
            ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                YgSectionTitleBar(
                  title: Text(
                    title,
                    style: theme.titleTextStyle,
                  ),
                  tag: tag,
                  trailing: trailing,
                  minAvailableTagWidth: theme.minAvailableTagWidth,
                  gap: theme.trailingSpacing,
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
