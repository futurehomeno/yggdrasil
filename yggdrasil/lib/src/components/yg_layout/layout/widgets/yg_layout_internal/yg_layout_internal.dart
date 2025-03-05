import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_layout/enums/yg_header_behavior.dart';
import 'package:yggdrasil/src/components/yg_layout/layout/controller/yg_layout_header_controller.dart';
import 'package:yggdrasil/src/components/yg_layout/layout/widgets/layout_header_renderer/_layout_renderer.dart';
import 'package:yggdrasil/src/components/yg_layout/layout/widgets/yg_layout_internal/yg_layout_header_loading_bar.dart';
import 'package:yggdrasil/src/components/yg_layout/layout/widgets/yg_layout_internal/yg_layout_header_shadow.dart';
import 'package:yggdrasil/src/components/yg_layout/layout/widgets/yg_layout_render_widget.dart';
import 'package:yggdrasil/src/theme/_theme.dart';

/// Internal widget which provides the internal layout for the [YgLayout].
class YgLayoutInternal extends StatelessWidget {
  const YgLayoutInternal({
    super.key,
    required this.content,
    required this.controller,
    required this.headerBehavior,
    this.appBar,
    this.bottom,
  });

  /// The content shown in the layout.
  final Widget content;

  /// The appBar shown in the layout.
  final Widget? appBar;

  /// The widget shown bellow the [appBar].
  final Widget? bottom;

  /// The controller responsible for animating the header.
  final YgLayoutHeaderController controller;

  /// The header behavior.
  final YgHeaderBehavior headerBehavior;

  @override
  Widget build(BuildContext context) {
    final YgLayoutTheme theme = context.layoutTheme;

    final Widget? appBar = this.appBar;
    final Widget? bottom = this.bottom;

    return Material(
      color: theme.backgroundColor,
      child: YgLayoutRenderWidget(
        children: <Widget>[
          content,
          MediaQuery.removePadding(
            removeTop: true,
            context: context,
            child: YgLayoutHeaderRenderWidget(
              padding: MediaQuery.paddingOf(context),
              controller: controller,
              behavior: headerBehavior,
              headerColor: theme.backgroundColor,
              children: <Widget>[
                if (appBar != null)
                  YgLayoutHeaderChildWidget(
                    slot: YgLayoutHeaderSlot.appBar,
                    child: appBar,
                  ),
                if (bottom != null)
                  YgLayoutHeaderChildWidget(
                    slot: YgLayoutHeaderSlot.trailing,
                    child: bottom,
                  ),
                YgLayoutHeaderLoadingBar(
                  controller: controller,
                ),
                YgLayoutHeaderShadow(
                  controller: controller,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
