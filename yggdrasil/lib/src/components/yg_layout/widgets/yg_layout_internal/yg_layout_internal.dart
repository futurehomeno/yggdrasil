import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yggdrasil/src/components/yg_layout/controller/yg_layout_header_controller.dart';
import 'package:yggdrasil/src/components/yg_layout/enums/yg_header_behavior.dart';
import 'package:yggdrasil/src/components/yg_layout/widgets/layout_header_renderer/_layout_renderer.dart';
import 'package:yggdrasil/src/components/yg_layout/widgets/yg_layout_internal/yg_layout_header_loading_bar.dart';
import 'package:yggdrasil/src/components/yg_layout/widgets/yg_layout_internal/yg_layout_header_shadow.dart';
import 'package:yggdrasil/src/components/yg_layout/widgets/yg_layout_render_widget.dart';
import 'package:yggdrasil/src/theme/_theme.dart';

class YgLayoutInternal extends StatelessWidget {
  const YgLayoutInternal({
    super.key,
    required this.content,
    required this.controller,
    required this.headerBehavior,
    this.appBar,
    this.trailing,
  });

  final Widget content;
  final Widget? appBar;
  final Widget? trailing;
  final YgLayoutHeaderController controller;
  final YgHeaderBehavior headerBehavior;

  @override
  Widget build(BuildContext context) {
    final YgLayoutTheme theme = context.layoutTheme;

    final Widget? appBar = this.appBar;
    final Widget? trailing = this.trailing;

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
                  if (trailing != null)
                    YgLayoutChildWidget(
                      slot: YgLayoutHeaderSlot.trailing,
                      child: trailing,
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
      ),
    );
  }
}
