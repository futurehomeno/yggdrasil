import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_layout/body/yg_layout_body_internal.dart';
import 'package:yggdrasil/src/components/yg_layout/controller/header_aware_scroll_physics.dart';
import 'package:yggdrasil/src/components/yg_layout/controller/yg_layout_header_controller.dart';
import 'package:yggdrasil/src/components/yg_layout/enums/yg_footer_behavior.dart';
import 'package:yggdrasil/src/components/yg_layout/widgets/yg_layout_content_positioner.dart';
import 'package:yggdrasil/src/components/yg_layout/widgets/yg_push_down_footer_render_widget.dart';
import 'package:yggdrasil/src/theme/_theme.dart';

class YgLayoutBody extends StatelessWidget {
  const YgLayoutBody({
    super.key,
    required this.child,
    this.footer,
    this.loading = false,
    this.footerBehavior = YgFooterBehavior.sticky,
  });

  final Widget child;
  final Widget? footer;
  final YgFooterBehavior footerBehavior;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return YgLayoutBodyInternal(
      builder: _buildContent,
      loading: loading,
    );
  }

  Widget _buildContent(BuildContext context, YgLayoutBodyController controller) {
    Widget? footer = this.footer;
    if (footer == null) {
      return _buildLayout(
        child: child,
        controller: controller,
        context: context,
      );
    }

    final YgLayoutTheme theme = context.layoutTheme;

    footer = Material(
      color: theme.backgroundColor,
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: footer,
        ),
      ),
    );

    switch (footerBehavior) {
      case YgFooterBehavior.sticky:
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            MediaQuery.removePadding(
              context: context,
              removeBottom: true,
              child: Expanded(
                child: _buildLayout(
                  child: child,
                  controller: controller,
                  context: context,
                ),
              ),
            ),
            footer,
          ],
        );
      case YgFooterBehavior.pushDown:
        return _buildLayout(
          child: YgPushDownFooterRenderWidget(
            children: <Widget>[
              child,
              footer,
            ],
          ),
          controller: controller,
          context: context,
        );
    }
  }

  Widget _buildLayout({
    required BuildContext context,
    required Widget child,
    required YgLayoutBodyController controller,
  }) {
    return RepaintBoundary(
      child: SingleChildScrollView(
        physics: HeaderAwareScrollPhysics(controller: controller),
        child: RepaintBoundary(
          child: YgLayoutContentPositioner(
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              removeBottom: true,
              removeLeft: true,
              removeRight: true,
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
