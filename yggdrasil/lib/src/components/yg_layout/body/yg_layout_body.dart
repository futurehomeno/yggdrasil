import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:yggdrasil/src/components/yg_layout/widgets/yg_layout_content_positioner.dart';
import 'package:yggdrasil/src/utils/yg_inherited_padding/yg_inherited_render_padding_provider_mixin.dart';

enum YgFooterBehavior {
  /// Footer sticks to the bottom of the screen.
  ///
  /// The footer will always be positioned at the bottom of the screen,
  /// regardless of the content height.
  sticky,

  /// Footer sticks to the bottom unless content is taller.
  ///
  /// The footer will be positioned at the bottom of the screen unless
  /// the main content height exceeds the remaining screen space, in which
  /// case the footer will be pushed down off the screen.
  pushDown,
}

class YgLayoutBody extends StatelessWidget {
  const YgLayoutBody({
    super.key,
    required this.child,
    this.footer,
    this.footerBehavior = YgFooterBehavior.sticky,
  });

  final Widget child;
  final Widget? footer;
  final YgFooterBehavior footerBehavior;

  @override
  Widget build(BuildContext context) {
    Widget? footer = this.footer;
    if (footer == null) {
      return _buildLayout(child);
    }

    footer = SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: footer,
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
                  child,
                ),
              ),
            ),
            footer,
          ],
        );
      case YgFooterBehavior.pushDown:
        return _buildLayout(
          YgPushDownFooterRenderWidget(
            children: <Widget>[
              child,
              footer,
            ],
          ),
        );
    }
  }

  Widget _buildLayout(Widget child) {
    return SingleChildScrollView(
      child: RepaintBoundary(
        child: YgLayoutContentPositioner(
          child: SafeArea(
            top: false,
            child: child,
          ),
        ),
      ),
    );
  }
}

class YgPushDownFooterRenderWidget extends MultiChildRenderObjectWidget {
  const YgPushDownFooterRenderWidget({
    super.key,
    super.children,
  });

  @override
  RenderObject createRenderObject(BuildContext context) {
    return YgPushDownFooterRenderer();
  }
}

class YgPushDownFooterRendererParentData extends ContainerBoxParentData<RenderBox> {}

class YgPushDownFooterRenderer extends RenderBox
    with
        ContainerRenderObjectMixin<RenderBox, YgPushDownFooterRendererParentData>,
        RenderBoxContainerDefaultsMixin<RenderBox, YgPushDownFooterRendererParentData>,
        YgInheritedRenderPaddingProviderMixin {
  @override
  void setupParentData(covariant RenderObject child) {
    child.parentData = YgPushDownFooterRendererParentData();
  }

  @override
  void performLayout() {
    final [
      RenderBox child,
      RenderBox footer,
    ] = getChildrenAsList();

    footer.layout(
      constraints.copyWith(
        minHeight: 0,
      ),
      parentUsesSize: true,
    );

    child.layout(
      BoxConstraints(
        minHeight: constraints.minHeight - footer.size.height,
        maxHeight: constraints.maxHeight - footer.size.height,
        maxWidth: constraints.maxWidth,
        minWidth: constraints.minWidth,
      ),
      parentUsesSize: true,
    );

    (footer.parentData as YgPushDownFooterRendererParentData).offset = Offset(
      0,
      child.size.height,
    );

    size = Size(
      constraints.maxWidth,
      child.size.height + footer.size.height,
    );
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    defaultPaint(
      context,
      offset,
    );
  }

  @override
  bool hitTestChildren(
    BoxHitTestResult result, {
    required Offset position,
  }) {
    return defaultHitTestChildren(
      result,
      position: position,
    );
  }
}
