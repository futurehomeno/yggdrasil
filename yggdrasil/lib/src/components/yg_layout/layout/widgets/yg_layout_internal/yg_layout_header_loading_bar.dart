import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_layout/layout/controller/yg_layout_header_controller.dart';
import 'package:yggdrasil/src/components/yg_layout/layout/controller/yg_layout_header_controller_value.dart';
import 'package:yggdrasil/src/components/yg_layout/layout/widgets/layout_header_renderer/_layout_renderer.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/src/utils/delayed_value_listenable_builder.dart';
import 'package:yggdrasil/src/utils/yg_animated_opacity.dart';

/// Internal widget which builds the loading bar shown in the [YgLayoutHeader].
class YgLayoutHeaderLoadingBar extends StatelessWidget {
  const YgLayoutHeaderLoadingBar({
    super.key,
    required this.controller,
  });

  /// The controller of the loading bar.
  final YgLayoutHeaderController controller;

  @override
  Widget build(BuildContext context) {
    final LinearProgressIndicatorTheme theme = context.progressIndicatorTheme.linearProgressIndicatorTheme;

    return YgLayoutHeaderChildWidget(
      slot: YgLayoutHeaderSlot.loading,
      child: RepaintBoundary(
        child: DelayedValueListenableBuilder<YgLayoutHeaderControllerValue>(
          valueListenable: controller,
          builder: (BuildContext context, YgLayoutHeaderControllerValue value, Widget? child) {
            return YgAnimatedOpacity(
              duration: const Duration(milliseconds: 200),
              opacity: value.loading ? 1 : 0,
              curve: Curves.easeInOut,
              child: LinearProgressIndicator(
                backgroundColor: theme.backgroundColor,
                color: theme.color,
                minHeight: 3,
              ),
            );
          },
        ),
      ),
    );
  }
}
