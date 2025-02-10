part of 'yg_layout.dart';

class YgLayoutTabbed extends YgLayout {
  const YgLayoutTabbed({
    super.key,
    super.appBar,
    super.trailing,
    required this.tabs,
    this.initialTab = 0,
    this.loading = false,
    super.headerBehavior = YgHeaderBehavior.fixed,
  }) : super._();

  final int initialTab;
  final List<YgLayoutTab> tabs;
  final bool loading;

  @override
  State<YgLayout> createState() => YgLayoutTabbedState();
}

class YgLayoutTabbedState extends _YgLayoutState<YgLayoutTabbed> {
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
