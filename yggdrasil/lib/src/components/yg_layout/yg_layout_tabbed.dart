import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yggdrasil/src/components/yg_layout/controller/yg_layout_header_controller_provider.dart';
import 'package:yggdrasil/src/components/yg_layout/enums/yg_header_behavior.dart';
import 'package:yggdrasil/src/components/yg_layout/models/yg_layout_tab.dart';
import 'package:yggdrasil/src/components/yg_layout/widgets/layout_header_renderer/_layout_renderer.dart';
import 'package:yggdrasil/src/components/yg_tab/yg_tab.dart';
import 'package:yggdrasil/src/components/yg_tab/yg_tab_bar.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/src/utils/yg_animated_opacity.dart';

import 'controller/yg_layout_header_controller.dart';
import 'widgets/yg_layout_render_widget.dart';

class YgLayoutTabbed extends StatefulWidget {
  const YgLayoutTabbed({
    super.key,
    required this.tabs,
    required this.appBar,
    this.initialTab = 0,
    this.headerBehavior = YgHeaderBehavior.static,
    this.loading = false,
  });

  final int initialTab;
  final List<YgLayoutTab> tabs;
  final Widget appBar;
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
    final LinearProgressIndicatorTheme pTheme = context.progressIndicatorTheme.linearProgressIndicatorTheme;

    return NotificationListener<ScrollMetricsNotification>(
      onNotification: _handleMetricsNotification,
      child: NotificationListener<ScrollUpdateNotification>(
        onNotification: _handleScrollNotification,
        child: DefaultTabController(
          length: widget.tabs.length,
          initialIndex: widget.initialTab,
          child: YgLayoutInternal(
            controller: _controller,
            headerBehavior: widget.headerBehavior,
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
            appBar: widget.appBar,
            trailing: Material(
              type: MaterialType.transparency,
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
            loadingBar: RepaintBoundary(
              child: YgAnimatedOpacity(
                duration: const Duration(milliseconds: 200),
                opacity: widget.loading ? 1 : 0,
                curve: Curves.easeInOut,
                child: LinearProgressIndicator(
                  backgroundColor: Colors.transparent,
                  color: pTheme.color,
                  minHeight: 2,
                ),
              ),
            ),
            shadow: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[
                    // Color.fromRGBO(36, 45, 65, 0.19),
                    // Color.fromRGBO(36, 45, 65, 0),
                    Colors.black.withOpacity(0.19),
                    Colors.black.withOpacity(0),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              height: 24,
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

  bool _handleMetricsNotification(ScrollMetricsNotification notification) {
    // print('_handleMetricsNotification $notification');

    return false;
  }
}

// ignore: prefer-single-widget-per-file
class YgLayoutInternal extends StatelessWidget {
  const YgLayoutInternal({
    super.key,
    required this.content,
    required this.controller,
    required this.headerBehavior,
    this.appBar,
    this.loadingBar,
    this.shadow,
    this.trailing,
  });

  final Widget content;
  final Widget? appBar;
  final Widget? trailing;
  final Widget? loadingBar;
  final Widget? shadow;
  final YgLayoutHeaderController controller;
  final YgHeaderBehavior headerBehavior;

  @override
  Widget build(BuildContext context) {
    final Widget? appBar = this.appBar;
    final Widget? trailing = this.trailing;
    final Widget? loadingBar = this.loadingBar;
    final Widget? shadow = this.shadow;

    final YgLayoutTheme theme = context.layoutTheme;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Theme.of(context).brightness,
      ),
      child: Material(
        color: theme.backgroundColor,
        child: YgLayoutRenderWidget(
          children: <Widget>[
            content,
            YgLayoutHeaderRenderWidget(
              controller: controller,
              behavior: headerBehavior,
              headerColor: theme.backgroundColor,
              children: <Widget>[
                if (appBar != null)
                  YgLayoutChildWidget(
                    slot: YgLayoutHeaderSlot.appBar,
                    child: appBar,
                  ),
                if (loadingBar != null)
                  YgLayoutChildWidget(
                    slot: YgLayoutHeaderSlot.loading,
                    child: loadingBar,
                  ),
                if (shadow != null)
                  YgLayoutChildWidget(
                    slot: YgLayoutHeaderSlot.shadow,
                    child: shadow,
                  ),
                if (trailing != null)
                  YgLayoutChildWidget(
                    slot: YgLayoutHeaderSlot.trailing,
                    child: trailing,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
