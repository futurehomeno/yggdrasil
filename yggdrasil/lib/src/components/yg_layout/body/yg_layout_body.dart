import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_layout/controller/yg_layout_body_controller_provider.dart';
import 'package:yggdrasil/src/components/yg_layout/controller/yg_layout_controller.dart';
import 'package:yggdrasil/src/components/yg_layout/enums/yg_footer_behavior.dart';
import 'package:yggdrasil/src/components/yg_layout/widgets/yg_layout_content_positioner.dart';
import 'package:yggdrasil/src/components/yg_layout/widgets/yg_push_down_footer_render_widget.dart';
import 'package:yggdrasil/src/theme/_theme.dart';

class YgLayoutBody extends StatefulWidget {
  const YgLayoutBody({
    super.key,
    required this.child,
    this.footer,
    this.footerBehavior = YgFooterBehavior.sticky,
  });

  final Widget child;
  final Widget? footer;
  final YgFooterBehavior footerBehavior;

  @override
  State<YgLayoutBody> createState() => _YgLayoutBodyState();
}

class _YgLayoutBodyState extends State<YgLayoutBody> {
  final ScrollController _scrollController = ScrollController();
  YgLayoutBodyControllerProvider? _layoutControllerProvider;

  @override
  void didChangeDependencies() {
    _layoutControllerProvider?.controller.removeScrollEventListener(_handleScrollEvent);
    _layoutControllerProvider = YgLayoutBodyControllerProvider.maybeOf(context);
    _layoutControllerProvider?.controller.addScrollEventListener(_handleScrollEvent);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget? footer = widget.footer;
    if (footer == null) {
      return _buildLayout(widget.child);
    }

    final YgLayoutTheme theme = context.layoutTheme;

    footer = Material(
      color: theme.backgroundColor,
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: footer,
        ),
      ),
    );

    switch (widget.footerBehavior) {
      case YgFooterBehavior.sticky:
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            MediaQuery.removePadding(
              context: context,
              removeBottom: true,
              child: Expanded(
                child: _buildLayout(
                  widget.child,
                ),
              ),
            ),
            footer,
          ],
        );
      case YgFooterBehavior.pushDown:
        return _buildLayout(
          YgPushDownFooterRenderWidget(
            children: <Widget>[
              widget.child,
              footer,
            ],
          ),
        );
    }
  }

  Widget _buildLayout(Widget child) {
    return NotificationListener<ScrollNotification>(
      onNotification: _handleScrollNotification,
      child: RepaintBoundary(
        child: SingleChildScrollView(
          controller: _scrollController,
          child: RepaintBoundary(
            child: YgLayoutContentPositioner(
              child: SafeArea(
                top: false,
                child: child,
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool _handleScrollNotification(ScrollNotification notification) {
    final YgLayoutBodyControllerProvider? provider = _layoutControllerProvider;
    if (provider != null) {
      provider.controller.handleScrollNotification(
        provider.index,
        notification,
      );
    }

    return false;
  }

  void _handleScrollEvent(YgLayoutScrollEvent event) {
    if (event.target != _layoutControllerProvider?.index) {
      return;
    }

    final double newOffset = _scrollController.position.extentBefore + event.offset;

    _scrollController.animateTo(
      newOffset,
      duration: event.duration,
      curve: event.curve,
    );
  }
}
