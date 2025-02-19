part of 'yg_layout.dart';

/// A layout with tabs.
///
/// Internally manages the tab controller and tab bar view. Automatically
/// selects the current tab as the scroll shadow and header animation provider.
///
/// Automatically resets the header location if the selected tab changes.
class _YgLayoutTabbed extends YgLayout {
  const _YgLayoutTabbed({
    super.key,
    super.appBar,
    super.bottom,
    required this.tabs,
    this.initialTab = 0,
    this.swiping = true,
    super.headerBehavior = YgHeaderBehavior.fixed,
  }) : super._();

  /// The tab shown when the widget first loads.
  final int initialTab;

  /// A list of tabs that are displayed in the layout.
  final List<YgLayoutTab> tabs;

  /// Whether the tabs can be swiped by the user.
  ///
  /// When set to false, the current tab can only be changed through clicking on
  /// another tab in the tab bar.
  final bool swiping;

  @override
  State<YgLayout> createState() => _YgLayoutTabbedState();
}

class _YgLayoutTabbedState extends _YgLayoutState<_YgLayoutTabbed> {
  @override
  Widget build(BuildContext context) {
    final Widget? trailing = widget.bottom;

    final ScrollPhysics? physics;
    if (widget.swiping) {
      physics = null;
    } else {
      physics = const NeverScrollableScrollPhysics();
    }

    return NotificationListener<ScrollUpdateNotification>(
      onNotification: _handleScrollNotification,
      child: DefaultTabController(
        length: widget.tabs.length,
        initialIndex: widget.initialTab,
        child: YgLayoutInternal(
          controller: _controller,
          headerBehavior: widget.headerBehavior,
          appBar: widget.appBar,
          bottom: Material(
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
            physics: physics,
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
