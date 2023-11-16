import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/tabs/_tabs.dart';
import 'package:yggdrasil/yggdrasil.dart';

import 'properties/_properties.dart';
import 'widgets/_widgets.dart';

/// Used for controlling views that consist of different tabs.
///
/// !-- IMPORTANT --!
/// There's no good way to make preferredSize use context to determine
/// the size from the theme.
///
/// !-- IMPORTANT --!
/// 5 px have been added to the preferredSize height to account for the
/// indicator height. This is a hack and should be fixed.
// TODO(dev): fix the preferredSize hack by making a custom YgTabBar.
class YgTabBar extends StatelessWidget with StatelessWidgetDebugMixin implements PreferredSizeWidget {
  const YgTabBar({
    super.key,
    required this.tabs,
    this.controller,
    this.isScrollable = false,
    this.onTap,
  }) : preferredSize = const Size.fromHeight(49.0); // See IMPORTANT above.

  /// The tabs inside of the tab bar.
  final List<YgTab> tabs;

  /// The controller for the tab bar.
  ///
  /// If a [TabController] is not provided, then there must be a
  /// [DefaultTabController] ancestor.
  final TabController? controller;

  /// Whether you can horizontally scroll in the tab bar.
  final bool isScrollable;

  /// Callback for when a tab is pressed.
  final ValueChanged<int>? onTap;

  /// The size of the tab bar.
  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    final YgTabsTheme tabsTheme = context.ygTheme.tabsTheme;

    return TabBar(
      tabs: tabs,
      onTap: onTap,
      controller: controller,
      isScrollable: isScrollable,
      physics: const ClampingScrollPhysics(),
      dividerColor: tabsTheme.dividerColor,
      indicator: YgUnderlineTabIndicator(
        gradient: tabsTheme.indicatorGradient,
        borderSide: BorderSide(width: tabsTheme.indicatorHeight),
      ),
      indicatorWeight: tabsTheme.indicatorHeight,
      indicatorPadding: EdgeInsets.zero,
      labelPadding: EdgeInsets.zero,
      labelStyle: tabsTheme.selectedLabelTextStyle,
      labelColor: tabsTheme.selectedLabelColor,
      unselectedLabelStyle: tabsTheme.unselectedLabelTextStyle,
      unselectedLabelColor: tabsTheme.unselectedLabelColor,
      overlayColor: YgTabBarOverlayColorProperty(
        defaultColor: tabsTheme.tabBarBackgroundColor,
        focusedColor: tabsTheme.focusBackgroundColor,
        pressedColor: tabsTheme.pressedBackgroundColor,
        hoveredColor: tabsTheme.hoverBackgroundColor,
      ),
    );
  }

  @override
  YgDebugType get debugType => YgDebugType.layout;
}
