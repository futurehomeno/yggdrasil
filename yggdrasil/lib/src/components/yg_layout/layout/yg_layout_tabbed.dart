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
    this.onTabChanged,
    this.onTabVisible,
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

  /// Called when a tab becomes visible in any way.
  ///
  /// Not to be confused with [onTabChanged] which gets called when the active
  /// tab changes. This callback instead gets called when a tab becomes in any
  /// way visible, which means this tab covers more than 0% of the screen.
  final ValueChanged<int>? onTabVisible;

  /// Called when the active tab changes.
  ///
  /// Not to be confused with [onTabVisible] which gets called when a tab becomes
  /// visible in any way. This callback instead gets called when the active tab
  /// changes, which means this tab covers more than 50% of the screen.
  final ValueChanged<int>? onTabChanged;

  @override
  State<YgLayout> createState() => _YgLayoutTabbedState();
}

class _YgLayoutTabbedState extends _YgLayoutState<_YgLayoutTabbed> {
  late double _page;

  @override
  void initState() {
    super.initState();
    widget.onTabVisible?.call(widget.initialTab);
    _page = widget.initialTab.toDouble();
  }

  @override
  Widget build(BuildContext context) {
    assert(
      widget.tabs.isNotEmpty,
      'tabs has contain at least one or more tabs.',
    );

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
      _handlePageChanged((notification.metrics as PageMetrics).page ?? 0);
    }

    return false;
  }

  void _handlePageChanged(double page) {
    final int activePage = page.round();
    final ValueChanged<int>? onTabVisible = widget.onTabVisible;
    final ValueChanged<int>? onTabChanged = widget.onTabChanged;

    if (_page.round() != activePage) {
      _controller.setActiveView(activePage);
      onTabChanged?.call(activePage);
    }

    if (onTabVisible != null) {
      final int next = page.ceil();
      final int previous = page.floor();

      if (next != previous) {
        if (_page.ceil() != next) {
          onTabVisible(next);
        } else if (_page.floor() != previous) {
          onTabVisible(previous);
        }
      }
    }

    _page = page;
  }
}
