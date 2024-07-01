import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/tabs/_tabs.dart';
import 'package:yggdrasil/src/theme/theme.dart';
import 'package:yggdrasil/yggdrasil.dart';

/// Used as base widget for `YgTabBar`.
///
/// !-- IMPORTANT --!
/// There's no good way to make preferredSize use context to determine
/// the size from the theme.
class YgTab extends StatelessWidget with StatelessWidgetDebugMixin implements PreferredSizeWidget {
  const YgTab({
    super.key,
    this.label,
    this.icon,
  }) : preferredSize = const Size.fromHeight(44.0); // See IMPORTANT above.

  /// Text to show inside the tab.
  final String? label;

  /// Icon to show inside the tab.
  final YgColorableIconData? icon;

  /// The size of the tab.
  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    final YgTabsTheme tabsTheme = context.ygTheme.tabsTheme;

    final YgIcon? icon = _buildIcon();

    return Padding(
      padding: tabsTheme.tabPadding,
      child: Column(
        children: <Widget>[
          if (icon != null) icon,
          if (label != null) _buildLabel(),
        ].withVerticalSpacing(tabsTheme.iconLabelSpacing),
      ),
    );
  }

  YgIcon? _buildIcon() {
    final YgColorableIconData? icon = this.icon;
    if (icon == null) {
      return null;
    }

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

  @override
  YgDebugType get debugType => YgDebugType.intractable;
}
