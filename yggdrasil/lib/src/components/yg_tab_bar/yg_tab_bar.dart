import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_tab_bar/yg_tab_bar_render_widget.dart';
import 'package:yggdrasil/src/theme/_theme.dart';

import 'tab/yg_tab.dart';
import 'tab/yg_tab_internal.dart';

class YgTabBar extends StatefulWidget implements PreferredSizeWidget {
  const YgTabBar({
    super.key,
    required this.tabs,
    this.controller,
  });

  final TabController? controller;
  final List<YgTab> tabs;

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
  }

  @override
  void didUpdateWidget(covariant YgTabBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    _updateKeys();
  }

  @override
  void didChangeDependencies() {
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
    if (controller == null || controller.indexIsChanging) {
      return;
    }

    final double offset = controller.offset;
    final int index = controller.index;

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

  void _scrollToTarget() {
    final BuildContext? context = _keys.elementAtOrNull(_targetIndex)?.currentContext;
    if (context == null) {
      return;
    }

    Scrollable.ensureVisible(
      context,
      curve: Curves.easeInOut,
      duration: _controller!.animationDuration,
      alignment: 0.5,
    );
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
                  children: _buildTabs(_controller!),
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

  List<Widget> _buildTabs(TabController controller) {
    final List<Widget> mapped = <Widget>[];

    for (int i = 0; i < widget.tabs.length; i++) {
      final YgTab tab = widget.tabs[i];
      mapped.add(
        YgTabInternal(
          key: _keys[i],
          icon: tab.icon,
          label: tab.label,
          onPressed: () => controller.animateTo(i),
        ),
      );
    }

    return mapped;
  }
}
