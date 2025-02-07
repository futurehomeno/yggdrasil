import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_layout/controller/yg_layout_header_controller.dart';
import 'package:yggdrasil/src/components/yg_layout/widgets/layout_header_renderer/_layout_renderer.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/src/utils/delayed_value_listenable_builder.dart';
import 'package:yggdrasil/src/utils/yg_animated_opacity.dart';

class YgLayoutHeaderLoadingBar extends StatelessWidget {
  const YgLayoutHeaderLoadingBar({
    super.key,
    required this.controller,
  });

  final YgLayoutHeaderController controller;

  @override
  Widget build(BuildContext context) {
    final LinearProgressIndicatorTheme theme = context.progressIndicatorTheme.linearProgressIndicatorTheme;

    return YgLayoutChildWidget(
      slot: YgLayoutHeaderSlot.loading,
      child: RepaintBoundary(
        child: DelayedValueListenableBuilder<YgLayoutState>(
          valueListenable: controller,
          builder: (BuildContext context, YgLayoutState value, Widget? child) {
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
