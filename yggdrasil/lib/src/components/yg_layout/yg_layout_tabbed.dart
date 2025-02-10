import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_layout/controller/yg_layout_header_controller_provider.dart';
import 'package:yggdrasil/src/components/yg_layout/enums/yg_header_behavior.dart';
import 'package:yggdrasil/src/components/yg_layout/models/yg_layout_tab.dart';
import 'package:yggdrasil/src/components/yg_tab/yg_tab.dart';
import 'package:yggdrasil/src/components/yg_tab/yg_tab_bar.dart';

import 'controller/yg_layout_header_controller.dart';
import 'widgets/yg_layout_internal/yg_layout_internal.dart';

class YgLayoutTabbed extends StatefulWidget {
  const YgLayoutTabbed({
    super.key,
    required this.tabs,
    this.appBar,
    this.trailing,
    this.initialTab = 0,
    this.headerBehavior = YgHeaderBehavior.fixed,
    this.loading = false,
  });

  final Widget? appBar;
  final Widget? trailing;
  final int initialTab;
  final List<YgLayoutTab> tabs;
  final YgHeaderBehavior headerBehavior;
  final bool loading;

  @override
  State<YgLayoutTabbed> createState() => _YgLayoutTabbedState();
}

class _YgLayoutTabbedState extends State<YgLayoutTabbed> with TickerProviderStateMixin {
  late final YgLayoutHeaderController _controller = YgLayoutHeaderController(vsync: this);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Widget? trailing = widget.trailing;

    return NotificationListener<ScrollUpdateNotification>(
      onNotification: _handleScrollNotification,
      child: DefaultTabController(
        length: widget.tabs.length,
        initialIndex: widget.initialTab,
        child: YgLayoutInternal(
          controller: _controller,
          headerBehavior: widget.headerBehavior,
          appBar: widget.appBar,
          trailing: Material(
            type: MaterialType.transparency,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                if (trailing != null) trailing,
                YgTabBar(
                  tabs: <YgTab>[
                    for (final YgLayoutTab tab in widget.tabs)
                      YgTab(
                        label: tab.title,
                      ),
                  ],
                ),
              ],
            ),
          ),
          content: TabBarView(
            children: <Widget>[
              for (int i = 0; i < widget.tabs.length; i++)
                YgLayoutHeaderControllerProvider(
                  controller: _controller,
                  index: i,
                  child: widget.tabs[i].content,
                ),
            ],
          ),
        ),
      ),
    );
  }

  bool _handleScrollNotification(ScrollUpdateNotification notification) {
    if (notification.depth == 0) {
      _controller.resetHeader();
      _controller.setActiveView((notification.metrics as PageMetrics).page?.round() ?? 0);
    }

    return false;
  }
}
