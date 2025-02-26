import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_tab_bar/yg_tab_bar_render_widget.dart';
import 'package:yggdrasil/src/theme/_theme.dart';

import 'tab/yg_tab.dart';
import 'tab/yg_tab_internal.dart';

/// A tab bar used for controlling views that consist of multiple tabs.
class YgTabBar extends StatefulWidget implements PreferredSizeWidget {
  const YgTabBar({
    super.key,
    required this.tabs,
    this.controller,
    this.onTap,
  });

  /// The tabs inside of the tab bar.
  final List<YgTab> tabs;

  /// The controller for the tab bar.
  ///
  /// If a [TabController] is not provided, then there must be a
  /// [DefaultTabController] ancestor.
  final TabController? controller;

  /// Callback for when a tab is pressed.
  final ValueChanged<int>? onTap;

  @override
  State<YgTabBar> createState() => _YgTabBarState();

  @override
  Size get preferredSize => const Size.fromHeight(44);
}

class _YgTabBarState extends State<YgTabBar> {
  final List<GlobalKey> _keys = <GlobalKey<State<StatefulWidget>>>[];
  TabController? _controller;
  int _targetIndex = -1;

  @override
  void initState() {
    super.initState();
    _updateKeys();

    // Ensure the initial tab is visible as soon as it builds.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToTarget(animated: false);
    });
  }

  @override
  void didUpdateWidget(covariant YgTabBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    _updateKeys();
  }

  void _updateKeys() {
    if (widget.tabs.length > _keys.length) {
      for (int i = _keys.length; i < widget.tabs.length; i++) {
        _keys.add(GlobalKey());
      }
    } else {
      _keys.removeRange(widget.tabs.length, _keys.length);
    }
  }

  @override
  void didChangeDependencies() {
    // We need both listeners as they get triggered for different reasons.
    _controller?.removeListener(_onChange);
    _controller?.animation?.removeListener(_onTick);
    _controller = widget.controller ?? DefaultTabController.of(context);
    _controller?.animation?.addListener(_onTick);
    _controller?.addListener(_onChange);

    if (_targetIndex == -1) {
      _targetIndex = _controller!.index;
    }

    super.didChangeDependencies();
  }

  void _onChange() {
    final TabController? controller = _controller;
    if (controller == null || !controller.indexIsChanging) {
      return;
    }

    if (_targetIndex != controller.index) {
      _targetIndex = controller.index;
      _scrollToTarget();
    }
  }

  void _onTick() {
    final TabController? controller = _controller;

    // If indexIsChanging is false, the user must be scrolling, which we want to
    // handle.
    if (controller == null || controller.indexIsChanging) {
      return;
    }

    final double offset = controller.offset;
    final int index = controller.index;

    // If the user starts to scroll in a direction, we assume he wants to go to
    // that tab, and make the tab visible.
    final int newTargetIndex;
    if (offset.abs() < 0.1) {
      newTargetIndex = index;
    } else {
      newTargetIndex = index + offset.sign.toInt();
    }

    if (newTargetIndex != _targetIndex) {
      _targetIndex = newTargetIndex;
      _scrollToTarget();
    }
  }

  void _scrollToTarget({bool animated = true}) {
    final BuildContext? context = _keys.elementAtOrNull(_targetIndex)?.currentContext;
    if (context == null) {
      return;
    }

    Scrollable.ensureVisible(
      context,
      curve: Curves.easeInOut,
      duration: animated ? _controller!.animationDuration : Duration.zero,
      alignment: 0.5,
    );
  }

  @override
  Widget build(BuildContext context) {
    final YgTabsTheme theme = context.tabsTheme;

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
                  controller: _controller!,
                  children: _buildTabs(),
                ),
              ),
            );
          },
        ),
        SizedBox(
          height: theme.dividerHeight,
          child: ColoredBox(
            color: theme.dividerColor,
          ),
        ),
      ],
    );
  }

  List<Widget> _buildTabs() {
    final List<Widget> mapped = <Widget>[];

    for (int i = 0; i < widget.tabs.length; i++) {
      final YgTab tab = widget.tabs[i];
      mapped.add(
        YgTabInternal(
          key: _keys[i],
          icon: tab.icon,
          label: tab.label,
          onPressed: () => _onTap(i),
        ),
      );
    }

    return mapped;
  }

  void _onTap(int index) {
    _controller?.animateTo(index);
    widget.onTap?.call(index);
  }
}
