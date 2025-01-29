// ignore_for_file: prefer-single-widget-per-file

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yggdrasil/src/components/yg_layout/controller/yg_layout_body_controller_provider.dart';
import 'package:yggdrasil/src/components/yg_layout/enums/yg_header_behavior.dart';
import 'package:yggdrasil/src/components/yg_layout/models/yg_layout_tab.dart';
import 'package:yggdrasil/src/components/yg_layout/widgets/layout_renderer/_layout_renderer.dart';
import 'package:yggdrasil/src/components/yg_tab/yg_tab.dart';
import 'package:yggdrasil/src/components/yg_tab/yg_tab_bar.dart';
import 'package:yggdrasil/src/theme/_theme.dart';

import 'controller/yg_layout_controller.dart';

class YgLayoutTabbed extends StatefulWidget {
  const YgLayoutTabbed({
    super.key,
    required this.tabs,
    required this.appBar,
    this.initialTab = 0,
    this.headerBehavior = YgHeaderBehavior.static,
  });

  final int initialTab;
  final List<YgLayoutTab> tabs;
  final Widget appBar;
  final YgHeaderBehavior headerBehavior;

  @override
  State<YgLayoutTabbed> createState() => _YgLayoutTabbedState();
}

class _YgLayoutTabbedState extends State<YgLayoutTabbed> with TickerProviderStateMixin {
  late final YgLayoutController _controller = YgLayoutController(vsync: this);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final YgLayoutTheme theme = context.layoutTheme;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: NotificationListener<ScrollUpdateNotification>(
        onNotification: _handleScrollNotification,
        child: Material(
          color: theme.backgroundColor,
          child: DefaultTabController(
            length: widget.tabs.length,
            initialIndex: widget.initialTab,
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: YgLayoutRenderWidget(
                controller: _controller,
                behavior: widget.headerBehavior,
                headerColor: theme.backgroundColor,
                padding: MediaQuery.paddingOf(context),
                children: <Widget>[
                  YgLayoutChildWidget(
                    slot: YgLayoutSlot.appBar,
                    child: widget.appBar,
                  ),
                  YgLayoutChildWidget(
                    slot: YgLayoutSlot.trailing,
                    child: Material(
                      type: MaterialType.transparency,
                      color: theme.backgroundColor,
                      child: IntrinsicHeight(
                        child: YgTabBar(
                          tabs: <YgTab>[
                            for (final YgLayoutTab tab in widget.tabs)
                              YgTab(
                                label: tab.title,
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  YgLayoutChildWidget(
                    slot: YgLayoutSlot.content,
                    child: TabBarView(
                      children: <Widget>[
                        for (int i = 0; i < widget.tabs.length; i++)
                          YgLayoutBodyControllerProvider(
                            controller: _controller,
                            index: i,
                            child: widget.tabs[i].content,
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
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
