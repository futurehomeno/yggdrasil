// ignore_for_file: prefer-single-widget-per-file

import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_layout/models/yg_layout_tab.dart';
import 'package:yggdrasil/src/components/yg_layout/widgets/yg_layout_render_widget.dart';
import 'package:yggdrasil/src/components/yg_tab/yg_tab.dart';
import 'package:yggdrasil/src/components/yg_tab/yg_tab_bar.dart';

class YgLayoutTabbed extends StatelessWidget {
  const YgLayoutTabbed({
    super.key,
    required this.tabs,
    required this.appBar,
    this.initialTab = 0,
  });

  final int initialTab;
  final List<YgLayoutTab> tabs;
  final Widget appBar;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: DefaultTabController(
        length: tabs.length,
        child: YgLayoutRenderWidget(
          children: <Widget>[
            TabBarView(
              children: <Widget>[
                for (final YgLayoutTab tab in tabs) tab.content,
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                appBar,
                YgTabBar(
                  tabs: <YgTab>[
                    for (final YgLayoutTab tab in tabs)
                      YgTab(
                        label: tab.title,
                      ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
