import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_layout/layout/widgets/yg_layout_header_controller_provider.dart';
import 'package:yggdrasil/src/theme/_theme.dart';

/// Wraps a [YgLayoutBody]'s scrollable with a [RefreshIndicator].
///
/// Reads the [YgLayout] header height from the parent
/// [YgLayoutHeaderControllerProvider] so the indicator settles below the
/// header instead of behind it.
class YgLayoutBodyRefreshIndicator extends StatelessWidget {
  const YgLayoutBodyRefreshIndicator({
    super.key,
    required this.onRefresh,
    required this.child,
  });

  /// Called when the user performs a pull-to-refresh gesture.
  final Future<void> Function() onRefresh;

  /// The scrollable to wrap.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final ValueListenable<double>? headerHeight =
        YgLayoutHeaderControllerProvider.maybeOf(context)?.controller.headerHeight;

    if (headerHeight == null) {
      return _build(context, 0);
    }

    return ValueListenableBuilder<double>(
      valueListenable: headerHeight,
      builder: (BuildContext context, double edgeOffset, _) => _build(context, edgeOffset),
    );
  }

  Widget _build(BuildContext context, double edgeOffset) {
    final YgLayoutTheme layoutTheme = context.layoutTheme;
    final CircularProgressIndicatorTheme indicatorTheme =
        context.progressIndicatorTheme.circularProgressIndicatorTheme;

    return RefreshIndicator(
      onRefresh: onRefresh,
      color: indicatorTheme.color,
      backgroundColor: layoutTheme.backgroundColor,
      edgeOffset: edgeOffset,
      child: child,
    );
  }
}
