import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_layout/controller/yg_layout_header_controller.dart';
import 'package:yggdrasil/src/components/yg_layout/controller/yg_layout_header_controller_provider.dart';

import '../widgets/yg_sliver_content_positioner.dart';

class YgSliverLayoutBody extends StatefulWidget {
  const YgSliverLayoutBody({
    super.key,
    required this.sliver,
  });

  final Widget sliver;

  @override
  State<YgSliverLayoutBody> createState() => _YgSliverLayoutBodyState();
}

class _YgSliverLayoutBodyState extends State<YgSliverLayoutBody> {
  YgLayoutHeaderControllerProvider? _layoutControllerProvider;
  final ScrollController _scrollController = ScrollController();

  @override
  void didChangeDependencies() {
    _layoutControllerProvider?.controller.removeScrollEventListener(_handleScrollEvent);
    _layoutControllerProvider = YgLayoutHeaderControllerProvider.maybeOf(context);
    _layoutControllerProvider?.controller.addScrollEventListener(_handleScrollEvent);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _layoutControllerProvider?.controller.removeScrollEventListener(_handleScrollEvent);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: _handleScrollNotification,
      child: CustomScrollView(
        controller: _scrollController,
        slivers: <Widget>[
          YgSliverContentPositioner(
            child: SliverSafeArea(
              top: false,
              sliver: widget.sliver,
            ),
          ),
        ],
      ),
    );
  }

  bool _handleScrollNotification(ScrollNotification notification) {
    final YgLayoutHeaderControllerProvider? provider = _layoutControllerProvider;
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
