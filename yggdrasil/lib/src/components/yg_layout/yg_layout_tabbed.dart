// ignore_for_file: prefer-single-widget-per-file

import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_layout/models/yg_layout_tab.dart';
import 'package:yggdrasil/src/components/yg_layout/widgets/yg_layout_render_widget.dart';
import 'package:yggdrasil/src/components/yg_tab/yg_tab.dart';
import 'package:yggdrasil/src/components/yg_tab/yg_tab_bar.dart';
import 'package:yggdrasil/src/theme/_theme.dart';

class YgLayoutTabbed extends StatefulWidget {
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
  State<YgLayoutTabbed> createState() => _YgLayoutTabbedState();
}

class _YgLayoutTabbedState extends State<YgLayoutTabbed> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(vsync: this);
  bool _changed = false;
  bool _underScrolled = false;
  Size _headerSize = Size.infinite;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final YgLayoutTheme theme = context.layoutTheme;

    return NotificationListener<ScrollUpdateNotification>(
      onNotification: _handleScrollNotification,
      child: Material(
        color: theme.backgroundColor,
        child: DefaultTabController(
          length: widget.tabs.length,
          initialIndex: widget.initialTab,
          child: YgLayoutRenderWidget(
            onAppBarSize: _handleAppBarSizeChange,
            headerTranslation: _controller,
            children: <Widget>[
              TabBarView(
                children: <Widget>[
                  for (final YgLayoutTab tab in widget.tabs) tab.content,
                ],
              ),
              Material(
                color: theme.backgroundColor,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    widget.appBar,
                    YgTabBar(
                      tabs: <YgTab>[
                        for (final YgLayoutTab tab in widget.tabs)
                          YgTab(
                            label: tab.title,
                          ),
                      ],
                      onTap: print,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool _handleScrollNotification(ScrollUpdateNotification notification) {
    if (notification.depth == 0) {
      if (!_changed) {
        return false;
      }

      _changed = false;
      _underScrolled = false;
      _controller.animateTo(
        0,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
      );
    } else if (notification.depth == 1) {
      final double change = (notification.scrollDelta ?? 0.0) / _headerSize.height;
      _controller.value += change;
      _changed = true;

      final bool underScrolled = _controller.value * _headerSize.height < notification.metrics.extentBefore;
      if (underScrolled != _underScrolled) {
        _underScrolled = underScrolled;
        setState(() {});
      }
    }

    return false;
  }

  void _handleAppBarSizeChange(Size newSize) {
    _headerSize = newSize;
  }

  Widget _buildShadow({
    required Alignment alignment,
    required bool shown,
  }) {
    final YgScrollShadowThemes scrollShadowThemes = context.internalTheme.scrollShadow;

    return Positioned(
      bottom: alignment.y > 0 ? 0 : null,
      top: alignment.y < 0 ? 0 : null,
      left: 0,
      right: 0,
      child: IgnorePointer(
        child: AnimatedOpacity(
          duration: scrollShadowThemes.fadeDuration,
          curve: scrollShadowThemes.fadeCurve,
          opacity: shown ? 1 : 0,
          child: Container(
            height: scrollShadowThemes.shadowSize,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  scrollShadowThemes.shadowColor,
                  Colors.transparent,
                ],
                end: -alignment,
                begin: alignment,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
