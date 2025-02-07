import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yggdrasil/src/components/yg_layout/enums/yg_header_behavior.dart';
import 'package:yggdrasil/src/components/yg_layout/widgets/layout_header_renderer/_layout_renderer.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/src/utils/yg_animated_opacity.dart';

import 'controller/yg_layout_header_controller.dart';
import 'widgets/yg_layout_render_widget.dart';

class YgLayoutInternal extends StatelessWidget {
  const YgLayoutInternal({
    super.key,
    required this.content,
    required this.controller,
    required this.headerBehavior,
    this.appBar,
    this.loadingBar,
    this.shadow,
    this.trailing,
  });

  final Widget content;
  final Widget? appBar;
  final Widget? trailing;
  final Widget? loadingBar;
  final Widget? shadow;
  final YgLayoutHeaderController controller;
  final YgHeaderBehavior headerBehavior;

  @override
  Widget build(BuildContext context) {
    final Widget? appBar = this.appBar;
    final Widget? trailing = this.trailing;
    final Widget? loadingBar = this.loadingBar;
    final Widget? shadow = this.shadow;

    final YgLayoutTheme theme = context.layoutTheme;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Theme.of(context).brightness,
      ),
      child: Material(
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
                    YgLayoutChildWidget(
                      slot: YgLayoutHeaderSlot.appBar,
                      child: appBar,
                    ),
                  if (loadingBar != null)
                    YgLayoutChildWidget(
                      slot: YgLayoutHeaderSlot.loading,
                      child: loadingBar,
                    ),
                  if (shadow != null)
                    YgLayoutChildWidget(
                      slot: YgLayoutHeaderSlot.shadow,
                      child: ValueListenableBuilder<bool>(
                        valueListenable: controller.headerShadow,
                        builder: (BuildContext context, bool value, Widget? child) {
                          return YgAnimatedOpacity(
                            opacity: value ? 1 : 0,
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.easeInOut,
                            child: shadow,
                          );
                        },
                      ),
                    ),
                  if (trailing != null)
                    YgLayoutChildWidget(
                      slot: YgLayoutHeaderSlot.trailing,
                      child: trailing,
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
