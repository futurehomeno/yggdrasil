import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_layout/enums/yg_footer_behavior.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/src/utils/yg_debug/enums/yg_debug_type.dart';
import 'package:yggdrasil/src/utils/yg_debug/stateful_widget_debug_mixin.dart';
import 'package:yggdrasil/src/utils/yg_debug/stateless_widget_debug_mixin.dart';
import 'package:yggdrasil/src/utils/yg_scroll_shadow/yg_scroll_shadow.dart';
import 'package:yggdrasil/src/utils/yg_scroll_shadow/yg_scroll_shadow_overlay.dart';

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
  const factory YgLayoutBody({
    required Widget child,
    Widget? footer,
    YgFooterBehavior footerBehavior,
    Key? key,
    bool loading,
  }) = _YgLayoutBodyRegular;

  /// Creates a scrollable sliver layout.
  ///
  /// Does not have a footer as a sliver list does not have a known end.
  const factory YgLayoutBody.sliver({
    Key? key,
    bool loading,
    required Widget sliver,
  }) = _YgLayoutBodySliver;

  bool get loading;
}
