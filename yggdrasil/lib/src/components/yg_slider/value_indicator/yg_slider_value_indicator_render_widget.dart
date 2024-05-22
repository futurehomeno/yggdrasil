import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:yggdrasil/yggdrasil.dart';

import 'yg_slider_value_indicator_style.dart';

class YgSliderValueIndicatorRenderWidget extends LeafRenderObjectWidget {
  const YgSliderValueIndicatorRenderWidget({
    super.key,
    required this.layerLink,
    required this.style,
    required this.value,
    required this.max,
    required this.min,
    required this.stepSize,
    required this.valueBuilder,
  });

  final YgSliderValueIndicatorStyle style;
  final Animation<double> value;
  final LayerLink layerLink;
  final double min;
  final double max;
  final double? stepSize;
  final YgSliderValueBuilder? valueBuilder;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return YgSliderValueIndicatorRenderer(
      max: max,
      min: min,
      stepSize: stepSize,
      style: style,
      value: value,
      valueBuilder: valueBuilder,
      layerLink: layerLink,
      defaultStyle: DefaultTextStyle.of(context).style,
      textDirection: Directionality.of(context),
    );
  }

  @override
  void updateRenderObject(BuildContext context, covariant YgSliderValueIndicatorRenderer renderObject) {
    renderObject.style = style;
    renderObject.value = value;
    renderObject.valueBuilder = valueBuilder;
    renderObject.layerLink = layerLink;
    renderObject.min = min;
    renderObject.max = max;
    renderObject.stepSize = stepSize;
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
    required double min,
    required double max,
    required double? stepSize,
    required YgSliderValueBuilder? valueBuilder,
  })  : _style = style,
        _value = value,
        _defaultStyle = defaultStyle,
        _layerLink = layerLink,
        _min = min,
        _max = max,
        _stepSize = stepSize,
        _valueBuilder = valueBuilder,
        _textPainter = TextPainter(
          textDirection: textDirection,
          textAlign: TextAlign.center,
        );

  // region Values

  double? _stepSize;
  double? get stepSize => _stepSize;
  set stepSize(double? newValue) {
    if (_stepSize != newValue) {
      _stepSize = newValue;
      markNeedsPaint();
    }
  }

  double _min;
  double get min => _min;
  set min(double newValue) {
    if (_min != newValue) {
      _min = newValue;
      markNeedsPaint();
    }
  }

  double _max;
  double get max => _max;
  set max(double newValue) {
    if (_max != newValue) {
      _max = newValue;
      markNeedsPaint();
    }
  }

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

  YgSliderValueBuilder? _valueBuilder;
  YgSliderValueBuilder? get valueBuilder => _valueBuilder;
  set valueBuilder(YgSliderValueBuilder? newValue) {
    if (_valueBuilder != newValue) {
      _valueBuilder = newValue;
      markNeedsPaint();
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

  void _paintValueIndicator(PaintingContext context, Offset offset) {
    // Extract variables used in this method.
    final Canvas canvas = context.canvas;
    final EdgeInsets padding = _style.valueIndicatorPadding.value;
    final BorderRadius radius = _style.valueIndicatorRadius.value;
    final Color color = _style.valueIndicatorColor.value;
    final double bottomOffset = _style.valueIndicatorBottomOffset.value;
    final double visibility = _style.valueIndicatorVisibility.value;
    final TextStyle effectiveTextStyle = defaultStyle.merge(_style.valueIndicatorTextStyle.value);
    final Color textColor = effectiveTextStyle.color ?? Colors.black;
    final double value = this.value.value;
    final double range = _max - _min;

    // Setup the text painter.
    _textPainter.text = TextSpan(
      style: effectiveTextStyle.copyWith(
        color: textColor.withOpacity(visibility),
      ),
      text: _valueBuilder?.call(value) ?? value.toStringAsFixed((stepSize ?? (range / 100)).precision),
    );

    _textPainter.layout(
      maxWidth: constraints.maxWidth - padding.horizontal,
      minWidth: 0,
    );

    // Calculate the transform matrix applied to the value indicator.
    final Size sliderSize = _layerLink.leaderSize ?? Size.zero;
    final double handleRadius = sliderSize.height / 2;
    final double handleTrackLength = sliderSize.width - sliderSize.height;
    final Size indicatorSize = padding.inflateSize(_textPainter.size);
    final double percentage = (value.clamp(_min, _max) - _min) / range;

    final Matrix4 matrix = Matrix4.identity()
      ..translate(
        handleRadius + (handleTrackLength * percentage),
        handleRadius,
      )
      ..scale(visibility)
      ..translate(
        -indicatorSize.width / 2,
        -indicatorSize.height - bottomOffset - handleRadius,
      );

    // Calculate the rect of the indicator.
    final Rect rect = offset & indicatorSize;
    final RRect rrect = radius.toRRect(rect);
    final Paint paint = Paint()..color = color.withOpacity(visibility);

    // Modify the matrix to keep the value indicator within outerRect.
    final Rect outerRect = offset & size;
    final Rect transformedRect = MatrixUtils.transformRect(matrix, rect);
    if (transformedRect.left < outerRect.left) {
      matrix.translate(outerRect.left - transformedRect.left);
    } else if (transformedRect.right > outerRect.right) {
      matrix.translate(outerRect.right - transformedRect.right);
    }

    // Apply the matrix and paint the value indicator.
    canvas.transform(matrix.storage);
    canvas.drawRRect(rrect, paint);
    _textPainter.paint(canvas, padding.topLeft);
  }
}
