import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'yg_slider_value_indicator_style.dart';

class YgSliderValueIndicatorRenderWidget extends LeafRenderObjectWidget {
  const YgSliderValueIndicatorRenderWidget({
    super.key,
    required this.layerLink,
    required this.style,
    required this.value,
  });

  final YgSliderValueIndicatorStyle style;
  final Animation<double> value;
  final LayerLink layerLink;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return YgSliderValueIndicatorRenderer(
      style: style,
      value: value,
      layerLink: layerLink,
      defaultStyle: DefaultTextStyle.of(context).style,
      textDirection: Directionality.of(context),
    );
  }

  @override
  void updateRenderObject(BuildContext context, covariant YgSliderValueIndicatorRenderer renderObject) {
    renderObject.style = style;
    renderObject.value = value;
    renderObject.layerLink = layerLink;
    renderObject.defaultStyle = DefaultTextStyle.of(context).style;
    renderObject.textDirection = Directionality.of(context);
  }
}

class YgSliderValueIndicatorRenderer extends RenderBox {
  YgSliderValueIndicatorRenderer({
    required YgSliderValueIndicatorStyle style,
    required Animation<double> value,
    required LayerLink layerLink,
    required TextStyle defaultStyle,
    required TextDirection textDirection,
  })  : _style = style,
        _value = value,
        _defaultStyle = defaultStyle,
        _layerLink = layerLink,
        _textPainter = TextPainter(
          textDirection: textDirection,
        );

  // region Values

  final TextPainter _textPainter;
  TextDirection get textDirection => _textPainter.textDirection!;
  set textDirection(TextDirection newValue) {
    if (_textPainter.textDirection != newValue) {
      _textPainter.textDirection = newValue;
      markNeedsLayout();
    }
  }

  TextStyle _defaultStyle;
  TextStyle get defaultStyle => _defaultStyle;
  set defaultStyle(TextStyle newValue) {
    if (_defaultStyle != newValue) {
      _defaultStyle = newValue;
      markNeedsLayout();
    }
  }

  LayerLink _layerLink;
  LayerLink get layerLink => _layerLink;
  set layerLink(LayerLink newValue) {
    if (_layerLink != newValue) {
      _layerLink = newValue;
      markNeedsPaint();
    }
  }

  YgSliderValueIndicatorStyle _style;
  YgSliderValueIndicatorStyle get style => _style;
  set style(YgSliderValueIndicatorStyle newValue) {
    if (_style != newValue) {
      markNeedsPaint();
      _style.removeListener(markNeedsPaint);
      _style = newValue;
      _style.addListener(markNeedsPaint);
    }
  }

  Animation<double> _value;
  Animation<double> get value => _value;
  set value(Animation<double> newValue) {
    if (_value != newValue) {
      markNeedsPaint();
      _value.removeListener(markNeedsPaint);
      _value = newValue;
      _value.addListener(markNeedsPaint);
    }
  }

  @override
  void attach(PipelineOwner owner) {
    _value.addListener(markNeedsLayout);
    _style.addListener(markNeedsPaint);
    super.attach(owner);
  }

  @override
  void detach() {
    _value.removeListener(markNeedsLayout);
    _style.removeListener(markNeedsPaint);
    super.detach();
  }

  // endregion

  @override
  void performLayout() {
    size = constraints.biggest;
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    ContainerLayer? layer = this.layer;

    if (layer is FollowerLayer) {
      layer
        ..link = _layerLink
        ..unlinkedOffset = offset;
    } else {
      layer = FollowerLayer(
        link: _layerLink,
        showWhenUnlinked: false,
        linkedOffset: Offset.zero,
        unlinkedOffset: offset,
      );

      this.layer = layer;
    }

    context.pushLayer(
      layer,
      _paintValueIndicator,
      Offset.zero,
      childPaintBounds: Rect.largest,
    );
  }

  void _paintValueIndicator(PaintingContext context, Offset _) {
    final Canvas canvas = context.canvas;

    final EdgeInsets padding = _style.valueIndicatorPadding.value;
    final BorderRadius radius = _style.valueIndicatorRadius.value;
    final Color color = _style.valueIndicatorColor.value;
    final double bottomOffset = _style.valueIndicatorBottomOffset.value;
    final double visibility = _style.valueIndicatorVisibility.value;
    final TextStyle effectiveTextStyle = defaultStyle.merge(_style.valueIndicatorTextStyle.value);
    final Color textColor = effectiveTextStyle.color ?? Colors.black;

    _textPainter.text = TextSpan(
      style: effectiveTextStyle.copyWith(
        color: textColor.withOpacity(visibility),
      ),
      text: _value.value.toStringAsFixed(2),
    );

    _textPainter.layout(
      maxWidth: constraints.maxWidth,
      minWidth: 0,
    );

    final Size sliderSize = _layerLink.leaderSize ?? Size.zero;
    final double handleRadius = sliderSize.height / 2;
    final double handleTrackLength = sliderSize.width - sliderSize.height;
    final Size indicatorSize = padding.inflateSize(_textPainter.size);

    final Rect rect = Offset.zero & padding.inflateSize(_textPainter.size);
    final RRect rrect = radius.toRRect(rect);
    final Paint paint = Paint()..color = color.withOpacity(visibility);

    final Matrix4 matrix = Matrix4.identity()
      ..translate(
        handleRadius + (handleTrackLength * value.value),
        handleRadius,
      )
      ..scale(visibility)
      ..translate(
        -indicatorSize.width / 2,
        -indicatorSize.height - bottomOffset - handleRadius,
      );

    canvas.transform(matrix.storage);
    canvas.drawRRect(rrect, paint);
    _textPainter.paint(canvas, padding.topLeft);
  }
}
