import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_layout/layout/controller/yg_layout_header_controller.dart';
import 'package:yggdrasil/src/components/yg_layout/layout/controller/yg_layout_header_controller_value.dart';
import 'package:yggdrasil/src/components/yg_layout/layout/widgets/layout_header_renderer/_layout_renderer.dart';
import 'package:yggdrasil/src/utils/delayed_value_listenable_builder.dart';
import 'package:yggdrasil/src/utils/yg_scroll_shadow/yg_scroll_shadow_gradient.dart';

/// Internal widget which builds the shadow shown under the [YgLayout] header.
class YgLayoutHeaderShadow extends StatelessWidget {
  const YgLayoutHeaderShadow({
    super.key,
    required this.controller,
  });

  /// The controller of the shadow.
  final YgLayoutHeaderController controller;

  @override
  Widget build(BuildContext context) {
    return YgLayoutHeaderChildWidget(
      slot: YgLayoutHeaderSlot.shadow,
      child: DelayedValueListenableBuilder<YgLayoutHeaderControllerValue>(
        valueListenable: controller,
        builder: (BuildContext context, YgLayoutHeaderControllerValue value, Widget? child) {
          return YgScrollShadowGradient(
            alignment: Alignment.topCenter,
            shown: value.shadow,
          );
        },
      ),
    );
  }
}
