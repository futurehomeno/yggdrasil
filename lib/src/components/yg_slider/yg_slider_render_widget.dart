import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'yg_slider_style.dart';

class YgSliderRenderWidget extends LeafRenderObjectWidget {
  const YgSliderRenderWidget({
    super.key,
    required this.style,
    required this.value,
    required this.currentValue,
    required this.onChange,
    required this.editingChanged,
  });

  final YgSliderStyle style;
  final Animation<double> value;
  final Animation<double> currentValue;
  final ValueChanged<double> onChange;
  final ValueChanged<bool> editingChanged;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return YgSliderRenderer(
      editingChanged: editingChanged,
      difference: currentValue,
      onChange: onChange,
      style: style,
      value: value,
    );
  }

  @override
  void updateRenderObject(BuildContext context, covariant YgSliderRenderer renderObject) {
    renderObject.editingChanged = editingChanged;
    renderObject.currentValue = currentValue;
    renderObject.onChange = onChange;
    renderObject.style = style;
    renderObject.value = value;
  }
}

class YgSliderRenderer extends RenderBox {
  YgSliderRenderer({
    required YgSliderStyle style,
    required Animation<double> value,
    required Animation<double> difference,
    required this.onChange,
    required this.editingChanged,
  })  : _style = style,
        _value = value,
        _difference = difference;

  // region Values

  ValueChanged<double> onChange;
  ValueChanged<bool> editingChanged;

  YgSliderStyle _style;
  YgSliderStyle get style => _style;
  set style(YgSliderStyle newValue) {
    if (_style != newValue) {
      if (_style.trackHeight.value != newValue.trackHeight.value) {
        markNeedsLayout();
      }
      markNeedsPaint();
      _style.removeListener(markNeedsPaint);
      _style.trackHeight.removeListener(markNeedsLayout);
      _style = newValue;
      _style.addListener(markNeedsPaint);
      _style.trackHeight.addListener(markNeedsLayout);
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

  Animation<double> _difference;
  Animation<double> get currentValue => _difference;
  set currentValue(Animation<double> newValue) {
    if (_difference != newValue) {
      markNeedsPaint();
      _difference.removeListener(markNeedsPaint);
      _difference = newValue;
      _difference.addListener(markNeedsPaint);
    }
  }

  @override
  void attach(PipelineOwner owner) {
    _value.addListener(markNeedsPaint);
    _difference.addListener(markNeedsPaint);
    _style.addListener(markNeedsPaint);
    _style.trackHeight.addListener(markNeedsLayout);
    super.attach(owner);
  }

  @override
  void detach() {
    _value.removeListener(markNeedsPaint);
    _difference.removeListener(markNeedsPaint);
    _style.removeListener(markNeedsPaint);
    _style.trackHeight.removeListener(markNeedsLayout);
    super.detach();
  }

  // endregion

  @override
  void performLayout() {
    size = constraints.constrain(
      Size(
        double.infinity,
        _style.trackHeight.value,
      ),
    );
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final Canvas canvas = context.canvas;

    final EdgeInsets handlePadding = style.handlePadding.value;

    final double value = this.value.value;
    final double currentValue = this.currentValue.value;

    final double handleRadius = size.height / 2;
    final double handleTrackLength = size.width - size.height;
    final Offset handleOffset = Offset(
          handleRadius + (handleTrackLength * value),
          size.height / 2,
        ) +
        offset;

    final Rect handleRect = Rect.fromCircle(center: handleOffset, radius: handleRadius);
    final Rect handleOuterRect = handlePadding.inflateRect(handleRect);

    /// Needs to be done in this order because [_drawTracks] adds a clip to the
    /// canvas.

    _paintHandle(
      canvas: canvas,
      handleRect: handleRect,
    );

    _drawTracks(
      offset: offset,
      handleOuterRect: handleOuterRect,
      canvas: canvas,
      handleRadius: handleRadius,
      currentValue: currentValue,
      handleOffset: handleOffset,
    );
  }

  void _drawTracks({
    required Canvas canvas,
    required Offset offset,
    required Rect handleOuterRect,
    required double handleRadius,
    required Offset handleOffset,
    required double currentValue,
  }) {
    final Rect outerRect = offset & size;
    final Paint rightPaint = Paint()..color = style.trackRightColor.value;
    final Paint leftPaint = Paint()..color = style.trackLeftColor.value;

    final Radius innerRadius = style.trackInnerRadius.value;
    final Radius outerRadius = style.trackOuterRadius.value;

    final Path clipPath = Path();

    /// Create the [RRect]'s for the tracks.
    final RRect leftRRect = _getRRect(
      outerRect.topLeft,
      handleOuterRect.bottomLeft,
      left: outerRadius,
      right: innerRadius,
    );

    final RRect rightRRect = _getRRect(
      handleOuterRect.topRight,
      outerRect.bottomRight,
      left: innerRadius,
      right: outerRadius,
    );

    /// Both draw the tracks and add the [RRect]'s to the clipPath used for the
    /// difference.
    if (leftRRect.width > 0) {
      clipPath.addRRect(leftRRect);
      canvas.drawRRect(leftRRect, leftPaint);
    }

    if (rightRRect.width > 0) {
      clipPath.addRRect(rightRRect);
      canvas.drawRRect(rightRRect, rightPaint);
    }

    canvas.clipPath(clipPath);

    /// Draw the difference as a line.
    final double diffScale = size.width - size.height;
    final Offset p1 = Offset(
          handleRadius + (currentValue * diffScale),
          size.height / 2,
        ) +
        offset;

    final Paint diffPaint = Paint()
      ..strokeWidth = min(size.height, style.differenceIndicatorHeight.value)
      ..color = style.differenceIndicatorColor.value
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawLine(p1, handleOffset, diffPaint);
  }

  void _paintHandle({
    required Canvas canvas,
    required Rect handleRect,
  }) {
    final Color handleColor = style.handleColor.value;
    final Paint handlePaint = Paint()..color = handleColor;
    canvas.drawOval(
      handleRect,
      handlePaint,
    );
  }

  RRect _getRRect(
    Offset p1,
    Offset p2, {
    Radius left = Radius.zero,
    Radius right = Radius.zero,
  }) =>
      RRect.fromLTRBAndCorners(
        p1.dx,
        p1.dy,
        p2.dx,
        p2.dy,
        bottomLeft: left,
        topLeft: left,
        bottomRight: right,
        topRight: right,
      );
}
