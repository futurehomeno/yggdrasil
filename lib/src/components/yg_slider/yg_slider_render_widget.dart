import 'dart:math' as math;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'yg_slider_state.dart';
import 'yg_slider_style.dart';

class YgSliderRenderWidget extends LeafRenderObjectWidget {
  const YgSliderRenderWidget({
    super.key,
    required this.style,
    required this.value,
    required this.currentValue,
    required this.onChange,
    required this.editingChanged,
    required this.state,
    required this.layerLink,
    required this.max,
    required this.min,
    required this.stepSize,
  });

  final YgSliderStyle style;
  final Animation<double> value;
  final Animation<double> currentValue;
  final ValueChanged<double> onChange;
  final ValueChanged<bool> editingChanged;
  final YgSliderState state;
  final LayerLink layerLink;
  final double min;
  final double max;
  final double? stepSize;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return YgSliderRenderer(
      editingChanged: editingChanged,
      difference: currentValue,
      onChange: onChange,
      style: style,
      value: value,
      state: state,
      layerLink: layerLink,
      gestureSettings: MediaQuery.gestureSettingsOf(context),
      min: min,
      max: max,
      stepSize: stepSize,
    );
  }

  @override
  void updateRenderObject(BuildContext context, covariant YgSliderRenderer renderObject) {
    renderObject.editingChanged = editingChanged;
    renderObject.currentValue = currentValue;
    renderObject.onChange = onChange;
    renderObject.style = style;
    renderObject.value = value;
    renderObject.state = state;
    renderObject.layerLink = layerLink;
    renderObject.gestureSettings = MediaQuery.gestureSettingsOf(context);
    renderObject.min = min;
    renderObject.max = max;
    renderObject.stepSize = stepSize;
  }
}

class YgSliderRenderer extends RenderBox {
  YgSliderRenderer({
    required YgSliderStyle style,
    required Animation<double> value,
    required Animation<double> difference,
    required DeviceGestureSettings gestureSettings,
    required LayerLink layerLink,
    required double min,
    required double max,
    required this.stepSize,
    required this.onChange,
    required this.editingChanged,
    required this.state,
  })  : _style = style,
        _value = value,
        _difference = difference,
        _min = min,
        _max = max,
        _layerLink = layerLink {
    _drag = HorizontalDragGestureRecognizer()
      ..onStart = _handleDragStart
      ..onUpdate = _handleDragUpdate
      ..onEnd = _handleDragEnd
      ..onCancel = _handleDragEnd
      ..gestureSettings = gestureSettings;
  }

  double? _initialValueOffset;

  // region Values

  ValueChanged<double> onChange;
  ValueChanged<bool> editingChanged;
  YgSliderState state;
  double? stepSize;

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

  double get _range => _max - _min;

  LayerLink _layerLink;
  LayerLink get layerLink => _layerLink;
  set layerLink(LayerLink newValue) {
    if (_layerLink != newValue) {
      _layerLink = newValue;
      markNeedsPaint();
    }
  }

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

  DeviceGestureSettings? get gestureSettings => _drag.gestureSettings;

  // This rule makes no sense here.
  // ignore: check-for-equals-in-render-object-setters
  set gestureSettings(DeviceGestureSettings? gestureSettings) {
    _drag.gestureSettings = gestureSettings;
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
    _layerLink.leaderSize = size;
  }

  // region Painting

  @override
  void paint(PaintingContext context, Offset offset) {
    if (layer == null) {
      layer = LeaderLayer(
        link: _layerLink,
        offset: offset,
      );
    } else {
      final LeaderLayer leaderLayer = layer! as LeaderLayer;
      leaderLayer
        ..link = _layerLink
        ..offset = offset;
    }

    context.pushLayer(
      layer!,
      _paintSlider,
      Offset.zero,
    );
  }

  void _paintSlider(PaintingContext context, Offset offset) {
    final Canvas canvas = context.canvas;

    // Extract values.
    final EdgeInsets handlePadding = style.handlePadding.value;
    final double value = _scaleDownValue(this.value.value);
    final double currentValue = _scaleDownValue(this.currentValue.value);

    // Calculate handle dimensions.
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
      ..strokeWidth = math.min(size.height, style.differenceIndicatorHeight.value)
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

  // endregion

  late final HorizontalDragGestureRecognizer _drag;

  double _scaleDownValue(double value) => (value.clamp(_min, _max) - _min) / _range;
  double _scaleUpValue(double value) => value * _range + _min;
  double _getScaledDownValueFromOffset(Offset offset) => (offset.dx - (size.height / 2)) / (size.width - size.height);

  void _handleDragStart(DragStartDetails details) {
    editingChanged(true);
    final double scaledOffsetValue = _getScaledDownValueFromOffset(details.localPosition);
    final double scaledValue = _scaleDownValue(_value.value);
    _initialValueOffset ??= scaledValue - scaledOffsetValue;
  }

  void _handleDragUpdate(DragUpdateDetails details) {
    final double scaledDownValue = _getScaledDownValueFromOffset(details.localPosition);
    final double actualScaledDownValue = scaledDownValue + (_initialValueOffset ?? 0);
    final double newValue = _scaleUpValue(actualScaledDownValue);
    final double? stepSize = this.stepSize;

    onChange(newValue.clamp(_min, _max));
  }

  void _handleDragEnd([DragEndDetails? details]) {
    editingChanged(false);
    _initialValueOffset = null;
  }

  @override
  void handleEvent(PointerEvent event, covariant BoxHitTestEntry entry) {
    if (event is PointerDownEvent && !state.disabled.value) {
      _drag.addPointer(event);
    }
    super.handleEvent(event, entry);
  }

  @override
  bool hitTestSelf(Offset position) => true;
}
