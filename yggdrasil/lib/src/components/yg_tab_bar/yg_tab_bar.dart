import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_tab_bar/yg_tab_bar_render_widget.dart';
import 'package:yggdrasil/src/theme/_theme.dart';

import 'tab/yg_tab.dart';
import 'tab/yg_tab_internal.dart';

class YgTabBar extends StatelessWidget implements PreferredSizeWidget {
  const YgTabBar({
    super.key,
    required this.tabs,
    this.controller,
  });

  final TabController? controller;
  final List<YgTab> tabs;

  @override
  Widget build(BuildContext context) {
    final YgTabsTheme theme = context.tabsTheme;

    final TabController controller = this.controller ?? DefaultTabController.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: constraints.maxWidth,
                ),
                child: YgTabBarRenderWidget(
                  indicatorStyle: YgTabIndicatorStyle(
                    padding: theme.tabOuterPadding,
                    height: theme.indicatorHeight,
                    decoration: BoxDecoration(
                      gradient: theme.indicatorGradient,
                      borderRadius: theme.indicatorRadius,
                    ),
                  ),
                  minWidth: constraints.maxWidth,
                  controller: controller,
                  children: _buildTabs(controller),
                ),
              ),
            );
          },
        ),
        SizedBox(
          height: theme.dividerHeight,
          child: ColoredBox(color: theme.dividerColor),
        ),
      ],
    );
  }

  List<Widget> _buildTabs(TabController controller) {
    final List<Widget> mapped = <Widget>[];

    for (int i = 0; i < tabs.length; i++) {
      final YgTab tab = tabs[i];
      mapped.add(
        YgTabInternal(
          icon: tab.icon,
          label: tab.label,
          onPressed: () => controller.animateTo(i),
        ),
      );
    }

    return mapped;
  }

  @override
  Size get preferredSize => const Size.fromHeight(44);
}
