import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_layout/controller/yg_layout_header_controller.dart';
import 'package:yggdrasil/src/components/yg_layout/widgets/layout_header_renderer/_layout_renderer.dart';
import 'package:yggdrasil/src/utils/delayed_value_listenable_builder.dart';
import 'package:yggdrasil/src/utils/yg_animated_opacity.dart';

class YgLayoutHeaderShadow extends StatelessWidget {
  const YgLayoutHeaderShadow({
    super.key,
    required this.controller,
  });

  final YgLayoutHeaderController controller;

  @override
  Widget build(BuildContext context) {
    return YgLayoutChildWidget(
      slot: YgLayoutHeaderSlot.shadow,
      child: RepaintBoundary(
        child: DelayedValueListenableBuilder<YgLayoutState>(
          valueListenable: controller,
          builder: (BuildContext context, YgLayoutState value, Widget? child) {
            return YgAnimatedOpacity(
              opacity: value.headerShadow ? 1 : 0,
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: <Color>[
                      // Color.fromRGBO(36, 45, 65, 0.19),
                      // Color.fromRGBO(36, 45, 65, 0),
                      Colors.black.withOpacity(0.19),
                      Colors.black.withOpacity(0),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                height: 24,
              ),
            );
          },
        ),
      ),
    );
  }
}
