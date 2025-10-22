import 'dart:math' as math;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

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
    required this.onChange,
    required this.editingChanged,
    required this.state,
  }) : _style = style,
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

  /// The offset percentage used to calculate the new slider value.
  double? _dragPercentageOffset;

  // region Dependencies

  ValueChanged<double> onChange;
  ValueChanged<bool> editingChanged;
  YgSliderState state;

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
    /// Either create or update the [LeaderLayer] used to position the value indicator.
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

    /// Add the [LeaderLayer] to the current painting context.
    context.pushLayer(
      layer!,
      _paintSlider,
      Offset.zero,
    );
  }

  /// Paints the slider on the [LeaderLayer].
  void _paintSlider(PaintingContext context, Offset offset) {
    final Canvas canvas = context.canvas;

    // Extract values.
    final EdgeInsets handlePadding = style.handlePadding.value;
    final double valuePercentage = _getPercentageFromValue(value.value);
    final double currentValuePercentage = _getPercentageFromValue(currentValue.value);

    // Calculate handle dimensions.
    final double handleRadius = size.height / 2;
    final double handleTrackLength = size.width - size.height;
    final Offset handleOffset =
        Offset(
          handleRadius + (handleTrackLength * valuePercentage),
          size.height / 2,
        ) +
        offset;

    final Rect handleRect = Rect.fromCircle(center: handleOffset, radius: handleRadius);
    final Rect handleOuterRect = handlePadding.inflateRect(handleRect);

    /// [_drawTracks] needs to be painted last since it adds clipping to the
    /// current painting context.

    _paintHandle(
      canvas: canvas,
      handleRect: handleRect,
    );

    _drawTracks(
      offset: offset,
      handleOuterRect: handleOuterRect,
      canvas: canvas,
      handleRadius: handleRadius,
      currentValue: currentValuePercentage,
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
      p1: outerRect.topLeft,
      p2: handleOuterRect.bottomLeft,
      left: outerRadius,
      right: innerRadius,
    );

    final RRect rightRRect = _getRRect(
      p1: handleOuterRect.topRight,
      p2: outerRect.bottomRight,
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
    final double differenceScale = size.width - size.height;
    final Offset p1 =
        Offset(
          handleRadius + (currentValue * differenceScale),
          size.height / 2,
        ) +
        offset;

    final Paint differencePaint = Paint()
      ..strokeWidth = math.min(size.height, style.differenceIndicatorHeight.value)
      ..color = style.differenceIndicatorColor.value
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawLine(p1, handleOffset, differencePaint);
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

  RRect _getRRect({
    required Offset p1,
    required Offset p2,
    required Radius left,
    required Radius right,
  }) => RRect.fromLTRBAndCorners(
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

  // region Gestures

  late final HorizontalDragGestureRecognizer _drag;

  /// Gets the slider percentage from a value.
  double _getPercentageFromValue(double value) => (value.clamp(_min, _max) - _min) / _range;

  /// Gets a value from a slider percentage.
  double _getValueFromPercentage(double value) => value * _range + _min;

  /// Gets a value from a drag offset.
  double _getPercentageFromDragOffset(Offset offset) => (offset.dx - (size.height / 2)) / (size.width - size.height);

  void _handleDragStart(DragStartDetails details) {
    editingChanged(true);

    final double inputPercentage = _getPercentageFromDragOffset(details.localPosition);
    if (YgConsts.isMobile) {
      // On mobile the value changes based on the drag delta, so we need an
      // initial position to calculate the delta later.
      final double initialPercentage = _getPercentageFromValue(_value.value);
      _dragPercentageOffset ??= initialPercentage - inputPercentage;
    } else {
      // For desktop / web we need an absolute position to calculate the value
      // which we at this point already have, so we update the onChange callback.
      final double newValue = _getValueFromPercentage(inputPercentage);
      onChange(newValue.clamp(_min, _max));
    }
  }

  void _handleDragUpdate(DragUpdateDetails details) {
    // Because the current value can be locked to a specific step size, we can
    // not use it together with delta to calculate a new value, because small
    // delta changes could be entirely ignored if they are less than half of the
    // step size. Instead we get value in percent and the current absolute position
    // in percent and use these together to calculate the new actual value.
    final double percentage = _getPercentageFromDragOffset(details.localPosition);
    final double offsetPercentage = percentage + (_dragPercentageOffset ?? 0);
    final double newValue = _getValueFromPercentage(offsetPercentage);

    onChange(newValue.clamp(_min, _max));
  }

  void _handleDragEnd([DragEndDetails? details]) {
    editingChanged(false);
    _dragPercentageOffset = null;
  }

  @override
  void handleEvent(PointerEvent event, covariant BoxHitTestEntry entry) {
    if (event is PointerDownEvent && !state.disabled.value) {
      // We need to add the drag first so that it has priority.
      _drag.addPointer(event);
    }
    super.handleEvent(event, entry);
  }

  @override
  bool hitTestSelf(Offset position) => true;

  // endregion
}
