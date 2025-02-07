import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_layout/controller/yg_layout_header_controller.dart';
import 'package:yggdrasil/src/components/yg_layout/controller/yg_layout_header_controller_provider.dart';

class YgLayoutBodyInternal extends StatefulWidget {
  const YgLayoutBodyInternal({
    super.key,
    required this.builder,
    this.loading = false,
  });

  final Widget Function(BuildContext context, YgLayoutBodyController controller) builder;
  final bool loading;

  @override
  State<YgLayoutBodyInternal> createState() => _YgLayoutBodyInternalState();
}

class _YgLayoutBodyInternalState extends State<YgLayoutBodyInternal> {
  late final YgLayoutBodyController _controller;
  YgLayoutHeaderControllerProvider? _provider;

  @override
  void initState() {
    super.initState();
    _controller = YgLayoutBodyController(
      loading: widget.loading,
    );
  }

  @override
  void didUpdateWidget(covariant YgLayoutBodyInternal oldWidget) {
    super.didUpdateWidget(oldWidget);
    _controller.loading = widget.loading;
  }

  @override
  void didChangeDependencies() {
    _updateProvider(YgLayoutHeaderControllerProvider.maybeOf(context));
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    final YgLayoutHeaderControllerProvider? provider = _provider;
    if (provider != null) {
      provider.controller.unregisterView(
        provider.index,
      );
    }

    _controller.dispose();
    super.dispose();
  }

  void _updateProvider(YgLayoutHeaderControllerProvider? provider) {
    final YgLayoutHeaderControllerProvider? oldProvider = _provider;
    if (provider == oldProvider) {
      // Nothing changed.
      return;
    }

    _provider = provider;

    oldProvider?.controller.unregisterView(oldProvider.index);
    provider?.controller.registerView(provider.index, _controller);
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollUpdateNotification>(
      onNotification: _handleScrollUpdateNotification,
      child: NotificationListener<ScrollMetricsNotification>(
        onNotification: _handleScrollMetricsNotification,
        child: widget.builder(
          context,
          _controller,
        ),
      ),
    );
  }

  bool _handleScrollUpdateNotification(ScrollUpdateNotification notification) {
    _controller.handleScrollUpdateNotification(notification);

    return false;
  }

  bool _handleScrollMetricsNotification(ScrollMetricsNotification notification) {
    _controller.handleScrollMetricsNotification(notification);

    return false;
  }
}
