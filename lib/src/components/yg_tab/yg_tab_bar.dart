import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_tab/widgets/yg_underline_tab_indicator.dart';
import 'package:yggdrasil/src/theme/tabs/_tabs.dart';
import 'package:yggdrasil/yggdrasil.dart';

/// Used for controlling views that consist of different tabs.
class YgTabBar extends StatelessWidget {
  const YgTabBar({
    super.key,
    required this.tabs,
    this.controller,
    this.isScrollable = false,
    this.onTap,
  });

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
      indicator: const YgUnderlineTabIndicator(),
      indicatorWeight: tabsTheme.indicatorHeight,
      indicatorPadding: EdgeInsets.zero,
      labelColor: tabsTheme.selectedIconColor,
      labelStyle: tabsTheme.selectedLabelTextStyle,
      labelPadding: EdgeInsets.zero,
      unselectedLabelColor: tabsTheme.unselectedIconColor,
      unselectedLabelStyle: tabsTheme.unselectedLabelTextStyle,
      splashBorderRadius: tabsTheme.contentContainerBorderRadius,
      overlayColor: MaterialStateProperty.resolveWith<Color?>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.focused)) {
            return tabsTheme.focusBackgroundColor;
          } else if (states.contains(MaterialState.pressed)) {
            return tabsTheme.pressedBackgroundColor;
          } else if (states.contains(MaterialState.hovered)) {
            return tabsTheme.hoverBackgroundColor;
          }

          return null;
        },
      ),
    );
  }
}
