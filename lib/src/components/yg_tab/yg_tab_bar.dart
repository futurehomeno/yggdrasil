import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_tab/widgets/yg_underline_tab_indicator.dart';
import 'package:yggdrasil/src/theme/tabs/_tabs.dart';
import 'package:yggdrasil/yggdrasil.dart';

/// Used for controlling views that consist of different tabs.
class YgTabBar extends StatefulWidget {
  const YgTabBar({
    super.key,
    required this.tabs,
    this.isScrollable = false,
    this.onTabPressed,
    this.initialIndex = 0,
  });

  /// The tabs inside of the tab bar.
  final List<YgTab> tabs;

  /// Whether you can horizontally scroll in the tab bar.
  final bool isScrollable;

  /// Callback for when a tab is pressed.
  final void Function(int)? onTabPressed;

  /// Index of the currently selected tab.
  final int initialIndex;

  @override
  State<YgTabBar> createState() => _YgTabBarState();
}

class _YgTabBarState extends State<YgTabBar> with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      vsync: this,
      length: widget.tabs.length,
      initialIndex: widget.initialIndex,
    );
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final YgTabsTheme tabsTheme = context.ygTheme.tabsTheme;

    return TabBar(
      tabs: widget.tabs,
      onTap: widget.onTabPressed,
      controller: _tabController,
      isScrollable: widget.isScrollable,
      physics: const ClampingScrollPhysics(),
      dividerColor: tabsTheme.dividerColor,
      indicator: const YgUnderlineTabIndicator(),
      indicatorColor: tabsTheme.indicatorColor,
      indicatorWeight: tabsTheme.indicatorHeight,
      indicatorPadding: tabsTheme.indicatorPadding,
      labelColor: tabsTheme.selectedIconColor,
      labelStyle: tabsTheme.selectedLabelTextStyle,
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
