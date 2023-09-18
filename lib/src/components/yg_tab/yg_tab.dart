import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/tabs/_tabs.dart';
import 'package:yggdrasil/yggdrasil.dart';

/// Used as base widget for `YgTabBar`.
class YgTab extends StatelessWidget {
  const YgTab({
    super.key,
    this.label,
    this.icon,
  });

  final String? label;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    final YgTabsTheme tabsTheme = context.ygTheme.tabsTheme;

    return Padding(
      padding: tabsTheme.tabItemPadding,
      child: Tab(
        text: label,
        iconMargin: tabsTheme.iconMargin,
        icon: icon != null
            ? SizedBox(
                height: tabsTheme.iconSize,
                width: tabsTheme.iconSize,
                child: icon,
              )
            : null,
      ),
    );
  }
}
