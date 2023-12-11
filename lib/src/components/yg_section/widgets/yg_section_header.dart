import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/section/extensions/section_header_theme.dart';
import 'package:yggdrasil/yggdrasil.dart';

import '_widgets.dart';

class YgSectionHeader extends StatelessWidget {
  const YgSectionHeader({
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

  /// The tag.
  final Widget? tag;

  /// The icon in front of the title and subtitle.
  final YgIcon? icon;

  @override
  Widget build(BuildContext context) {
    final YgSectionHeaderTheme theme = context.sectionTheme.sectionHeader;
    final String? subtitle = this.subtitle;
    final YgIcon? icon = this.icon;
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
              child: icon,
            ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                YgSectionTitleBar(
                  title: Builder(builder: (BuildContext context) {
                    return Text(
                      title,
                      style: theme.titleTextStyle.copyWith(
                        color: DefaultTextStyle.of(context).style.color,
                      ),
                    );
                  }),
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
