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

  /// Text to show inside the tab.
  final String? label;

  /// Icon to show inside the tab.
  final String? icon;

  @override
  Widget build(BuildContext context) {
    final YgTabsTheme tabsTheme = context.ygTheme.tabsTheme;

    return Padding(
      padding: tabsTheme.tabPadding,
      child: Column(
        children: <Widget>[
          if (icon != null) _buildIcon(),
          if (label != null) _buildLabel(),
        ].withVerticalSpacing(tabsTheme.iconLabelSpacing),
      ),
    );
  }

  YgIcon _buildIcon() {
    return YgIcon(
      icon,
      size: YgIconSize.small,
    );
  }

  // Test style is handled by [TabBar].
  Widget _buildLabel() {
    return Text(
      label!,
      overflow: TextOverflow.ellipsis,
    );
  }
}
