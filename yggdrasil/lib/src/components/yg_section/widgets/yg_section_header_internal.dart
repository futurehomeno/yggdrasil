import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_section/widgets/_widgets.dart';
import 'package:yggdrasil/src/theme/section/extensions/section_header_theme.dart';
import 'package:yggdrasil/src/theme/theme.dart';
import 'package:yggdrasil/yggdrasil.dart';

// TODO(DEV-3018): Rework interface so there are no longer 2 trailing widget,
// but an array instead.
class YgSectionHeaderInternal extends StatelessWidget {
  const YgSectionHeaderInternal({
    super.key,
    required this.title,
    this.subtitle,
    this.trailingInternal,
    this.trailing,
    this.icon,
  });

  /// The title of the section.
  final String title;

  /// The subtitle of the section.
  final String? subtitle;

  /// The internal widget trailing the title and trailing widget.
  final Widget? trailingInternal;

  /// The trailing widget.
  final Widget? trailing;

  /// The icon in front of the title and subtitle.
  final YgIconData? icon;

  @override
  Widget build(BuildContext context) {
    final YgSectionHeaderTheme theme = context.sectionTheme.sectionHeader;
    final String? subtitle = this.subtitle;
    final YgIconData? icon = this.icon;
    final Widget? trailing = this.trailing;
    final Widget? trailingInternal = this.trailingInternal;

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
                  trailing: trailing,
                  trailingInternal: trailingInternal,
                  minAvailableTrailingWidth: theme.minAvailableTrailingWidth,
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
