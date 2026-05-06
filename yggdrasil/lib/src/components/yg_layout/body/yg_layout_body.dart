import 'dart:math';

import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_layout/enums/yg_footer_behavior.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/src/utils/yg_debug/enums/yg_debug_type.dart';
import 'package:yggdrasil/src/utils/yg_debug/stateful_widget_debug_mixin.dart';
import 'package:yggdrasil/src/utils/yg_debug/stateless_widget_debug_mixin.dart';
import 'package:yggdrasil/src/utils/yg_scroll_shadow/yg_scroll_shadow.dart';

import 'controller/_controller.dart';
import 'widgets/_widgets.dart';

part 'yg_layout_body_regular.dart';
part 'yg_layout_body_sliver.dart';

/// A layout component responsible for adding scroll and a footer.
///
/// Should always be used as a child of [YgLayout], notifies the parent
/// [YgLayout] about the scroll position, and whether the view connected to this
/// [YgLayoutBody] is loading.
abstract class YgLayoutBody extends Widget {
  /// Creates a scrollable layout with a optional footer.
  ///
  /// Enforces a minimum height on its child to allow centering of the content.
  ///
  /// When [onRefresh] is provided, a pull-to-refresh gesture is enabled on the
  /// scrollable. The returned [Future] should complete when the refresh is
  /// done; the indicator stays visible until then.
  const factory YgLayoutBody({
    required Widget child,
    bool reverse,
    Widget? footer,
    YgFooterBehavior footerBehavior,
    Key? key,
    bool loading,
    bool preserveFooterInset,
    Future<void> Function()? onRefresh,
  }) = _YgLayoutBodyRegular;

  /// Creates a scrollable sliver layout.
  ///
  /// Does not have a footer as a sliver list does not have a known end.
  ///
  /// When [onRefresh] is provided, a pull-to-refresh gesture is enabled on the
  /// scrollable. The returned [Future] should complete when the refresh is
  /// done; the indicator stays visible until then.
  const factory YgLayoutBody.sliver({
    Key? key,
    bool loading,
    required Widget sliver,
    Future<void> Function()? onRefresh,
  }) = _YgLayoutBodySliver;

  bool get loading;
}

/// Builds the parent physics chain used when pull-to-refresh is enabled.
///
/// Layers the platform's default physics under [AlwaysScrollableScrollPhysics]
/// so the [RefreshIndicator] receives proper overscroll notifications even
/// when the content is shorter than the viewport.
ScrollPhysics? _refreshPhysicsParent(BuildContext context, Future<void> Function()? onRefresh) {
  if (onRefresh == null) {
    return null;
  }

  return AlwaysScrollableScrollPhysics(
    parent: ScrollConfiguration.of(context).getScrollPhysics(context),
  );
}
