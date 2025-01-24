import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:yggdrasil/src/utils/yg_inherited_padding/yg_inherited_render_padding_provider_mixin.dart';

class YgLayoutRenderWidget extends MultiChildRenderObjectWidget {
  const YgLayoutRenderWidget({
    super.key,
    super.children,
    required this.onAppBarSize,
    required this.headerTranslation,
  });

  final ValueChanged<Size> onAppBarSize;
  final Animation<double> headerTranslation;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return YgLayoutRenderer(
      onAppBarSize: onAppBarSize,
      headerTranslation: headerTranslation,
    );
  }

  @override
  void updateRenderObject(BuildContext context, covariant YgLayoutRenderer renderObject) {
    renderObject.onAppBarSize = onAppBarSize;
    renderObject.headerTranslation = headerTranslation;
  }
}

class YgLayoutRendererParentData extends ContainerBoxParentData<RenderBox> {}

class YgLayoutRenderer extends RenderBox
    with
        ContainerRenderObjectMixin<RenderBox, YgLayoutRendererParentData>,
        RenderBoxContainerDefaultsMixin<RenderBox, YgLayoutRendererParentData>,
        YgInheritedRenderPaddingProviderMixin {
  YgLayoutRenderer({
    required ValueChanged<Size> onAppBarSize,
    required Animation<double> headerTranslation,
  })  : _onAppBarSize = onAppBarSize,
        _headerTranslation = headerTranslation;

  ValueChanged<Size> _onAppBarSize;
  ValueChanged<Size> get onAppBarSize => _onAppBarSize;
  set onAppBarSize(ValueChanged<Size> onAppBarSize) {
    if (_onAppBarSize != onAppBarSize) {
      _onAppBarSize = onAppBarSize;
      markNeedsLayout();
    }
  }

  Animation<double> _headerTranslation;
  Animation<double> get headerTranslation => _headerTranslation;
  set headerTranslation(Animation<double> headerTranslation) {
    if (_headerTranslation != headerTranslation) {
      _headerTranslation.removeListener(markNeedsPaint);
      _headerTranslation = headerTranslation;
      _headerTranslation.addListener(markNeedsPaint);
      markNeedsLayout();
    }
  }

  @override
  void setupParentData(covariant RenderObject child) {
    child.parentData = YgLayoutRendererParentData();
  }

  @override
  void performLayout() {
    final [
      RenderBox content,
      RenderBox appBar,
    ] = getChildrenAsList();

    appBar.layout(
      BoxConstraints(
        minHeight: 0,
        maxHeight: constraints.maxHeight,
        maxWidth: constraints.maxWidth,
        minWidth: constraints.maxWidth,
      ),
      parentUsesSize: true,
    );

    _onAppBarSize(appBar.size);

    setPadding(
      EdgeInsets.only(
        top: appBar.size.height,
      ),
    );

    content.layout(
      BoxConstraints.tight(
        constraints.smallest,
      ),
    );

    size = constraints.biggest;
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final [
      RenderBox content,
      RenderBox appBar,
    ] = getChildrenAsList();

    (appBar.parentData as YgLayoutRendererParentData).offset = Offset(
      0,
      -appBar.size.height * _headerTranslation.value,
    );
    defaultPaint(context, offset);
  }

  @override
  bool hitTestChildren(BoxHitTestResult result, {required Offset position}) {
    return defaultHitTestChildren(result, position: position);
  }

  @override
  void attach(PipelineOwner owner) {
    _headerTranslation.addListener(markNeedsPaint);
    super.attach(owner);
  }

  @override
  void dispose() {
    _headerTranslation.removeListener(markNeedsPaint);
    super.dispose();
  }
}
