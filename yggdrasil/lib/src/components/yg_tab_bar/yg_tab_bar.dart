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
    _controller = widget.controller ?? DefaultTabController.of(context);
    _controller?.addListener(_onChange);
    super.didChangeDependencies();
  }

  void _onChange() {
    final BuildContext? context = _keys.elementAtOrNull(_controller!.index)?.currentContext;
    if (context == null) {
      return;
    }

    print('Scrollable.ensureVisible: ${_controller!.index}');

    Scrollable.ensureVisible(
      context,
      curve: Curves.easeInOut,
      duration: const Duration(
        milliseconds: 200,
      ),
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
          child: ColoredBox(color: theme.dividerColor),
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
