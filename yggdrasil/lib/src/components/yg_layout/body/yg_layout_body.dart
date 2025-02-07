import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_layout/body/yg_layout_body_internal.dart';
import 'package:yggdrasil/src/components/yg_layout/controller/header_aware_scroll_physics.dart';
import 'package:yggdrasil/src/components/yg_layout/controller/yg_layout_header_controller.dart';
import 'package:yggdrasil/src/components/yg_layout/enums/yg_footer_behavior.dart';
import 'package:yggdrasil/src/components/yg_layout/widgets/yg_layout_content_positioner.dart';
import 'package:yggdrasil/src/components/yg_layout/widgets/yg_push_down_footer_render_widget.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/src/utils/yg_animated_opacity.dart';

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
        return _buildStickyLayout(
          context,
          controller,
          footer,
        );
      case YgFooterBehavior.pushDown:
        return _buildPushDownLayout(
          context,
          controller,
          footer,
        );
    }
  }

  Widget _buildPushDownLayout(
    BuildContext context,
    YgLayoutBodyController controller,
    Widget footer,
  ) {
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

  Column _buildStickyLayout(
    BuildContext context,
    YgLayoutBodyController controller,
    Widget footer,
  ) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Expanded(
          child: Stack(
            children: <Widget>[
              Positioned.fill(
                child: MediaQuery.removePadding(
                  context: context,
                  removeBottom: true,
                  child: _buildLayout(
                    child: child,
                    controller: controller,
                    context: context,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: RepaintBoundary(
                  child: ValueListenableBuilder<YgLayoutBodyState>(
                    valueListenable: controller,
                    builder: (BuildContext context, YgLayoutBodyState value, Widget? child) {
                      return YgAnimatedOpacity(
                        opacity: value.extendAfter > 0.01 ? 1 : 0,
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
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                          height: 24,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        footer,
      ],
    );
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
