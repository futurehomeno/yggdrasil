import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_chart/models/_models.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

/// The event density rail of a [YgChart].
///
/// Renders every event as a thin vertical tick on a rounded track and maps
/// taps and horizontal drags to the one column wide band under the pointer,
/// so the app can render the events of the selected band itself. The
/// selected band is outlined on the track.
class YgChartEventRail extends StatelessWidget with StatelessWidgetDebugMixin {
  const YgChartEventRail({
    super.key,
    required this.events,
    required this.bandCount,
    required this.trackColor,
    required this.defaultEventColor,
    required this.selectionColor,
    this.selectedBand,
    this.bandSemanticValues,
    this.onBandSelected,
  });

  /// Height of the rail track.
  static const double height = 24.0;

  /// Vertical spacing between the plot and the rail.
  static const double plotSpacing = 6.0;

  /// The events rendered as ticks, see [YgChartRailEvent].
  final List<YgChartRailEvent> events;

  /// Amount of selectable bands, one per chart column.
  final int bandCount;

  /// Color of the rounded track behind the ticks.
  final Color trackColor;

  /// Color of ticks of events without an own color.
  final Color defaultEventColor;

  /// Color of the outline around the selected band.
  final Color selectionColor;

  /// Index of the outlined band, or null when nothing is selected.
  final int? selectedBand;

  /// Semantic descriptions of the bands, one per band (for example the
  /// x-axis labels), read by screen readers as the adjustable value.
  final List<String>? bandSemanticValues;

  /// Called with the band under the pointer while tapping or dragging
  /// along the rail.
  ///
  /// Only called when the band changes; the selection itself is owned by
  /// the caller, see [YgChart.selectedRailBand].
  final ValueChanged<int>? onBandSelected;

  @override
  Widget build(BuildContext context) {
    final bool interactive = onBandSelected != null && bandCount > 0;
    final int nextBand = math.min(bandCount - 1, (selectedBand ?? -1) + 1);
    final int previousBand = math.max(0, (selectedBand ?? bandCount) - 1);
    final String? semanticValue = _semanticValueOf(selectedBand);

    // Dragging is not operable with assistive tech, so the rail is exposed
    // as an adjustable element stepping through the bands.
    return Semantics(
      slider: interactive,
      value: semanticValue,
      increasedValue: semanticValue == null ? null : (_semanticValueOf(nextBand) ?? semanticValue),
      decreasedValue: semanticValue == null ? null : (_semanticValueOf(previousBand) ?? semanticValue),
      onIncrease: interactive ? () => _selectBand(nextBand) : null,
      onDecrease: interactive ? () => _selectBand(previousBand) : null,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final double width = constraints.maxWidth;

          return GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTapDown: interactive ? (TapDownDetails details) => _reportBandAt(width, details.localPosition) : null,
            onHorizontalDragStart: interactive
                ? (DragStartDetails details) => _reportBandAt(width, details.localPosition)
                : null,
            onHorizontalDragUpdate: interactive
                ? (DragUpdateDetails details) => _reportBandAt(width, details.localPosition)
                : null,
            child: CustomPaint(
              size: const Size(double.infinity, height),
              painter: _YgChartEventRailPainter(
                events: events,
                bandCount: bandCount,
                trackColor: trackColor,
                defaultEventColor: defaultEventColor,
                selectionColor: selectionColor,
                selectedBand: selectedBand,
              ),
            ),
          );
        },
      ),
    );
  }

  void _reportBandAt(double width, Offset localPosition) {
    if (width <= 0.0) {
      return;
    }

    final double bandWidth = width / bandCount;
    _selectBand(localPosition.dx ~/ bandWidth);
  }

  void _selectBand(int band) {
    final int clampedBand = math.max(0, math.min(bandCount - 1, band));
    if (clampedBand != selectedBand) {
      onBandSelected!(clampedBand);
    }
  }

  String? _semanticValueOf(int? band) {
    final List<String>? values = bandSemanticValues;
    if (values == null || band == null || band < 0 || band >= values.length) {
      return null;
    }

    return values[band];
  }
}

class _YgChartEventRailPainter extends CustomPainter {
  _YgChartEventRailPainter({
    required this.events,
    required this.bandCount,
    required this.trackColor,
    required this.defaultEventColor,
    required this.selectionColor,
    required this.selectedBand,
  });

  static const double _trackRadius = 4.0;
  static const double _tickWidth = 2.0;
  static const double _tickVerticalInset = 2.0;
  static const double _selectionStrokeWidth = 2.0;

  final List<YgChartRailEvent> events;
  final int bandCount;
  final Color trackColor;
  final Color defaultEventColor;
  final Color selectionColor;
  final int? selectedBand;

  @override
  void paint(Canvas canvas, Size size) {
    if (size.width <= 0.0 || size.height <= 0.0 || bandCount <= 0) {
      return;
    }

    final Paint paint = Paint()..color = trackColor;
    canvas.drawRRect(
      RRect.fromRectAndRadius(Offset.zero & size, const Radius.circular(_trackRadius)),
      paint,
    );

    for (final YgChartRailEvent event in events) {
      final double fraction = math.max(0.0, math.min(1.0, event.position / bandCount));
      final double centerX = math.max(
        _tickWidth / 2.0,
        math.min(size.width - _tickWidth / 2.0, fraction * size.width),
      );

      paint.color = event.color ?? defaultEventColor;
      // Ticks are raw rectangles without rounded caps.
      canvas.drawRect(
        Rect.fromLTRB(
          centerX - _tickWidth / 2.0,
          _tickVerticalInset,
          centerX + _tickWidth / 2.0,
          size.height - _tickVerticalInset,
        ),
        paint,
      );
    }

    final int? selectedBand = this.selectedBand;
    if (selectedBand != null && selectedBand >= 0 && selectedBand < bandCount) {
      final double bandWidth = size.width / bandCount;
      final Paint selectionPaint = Paint()
        ..color = selectionColor
        ..style = PaintingStyle.stroke
        ..strokeWidth = _selectionStrokeWidth;

      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTRB(
            selectedBand * bandWidth,
            0.0,
            (selectedBand + 1) * bandWidth,
            size.height,
          ).deflate(_selectionStrokeWidth / 2.0),
          const Radius.circular(_trackRadius),
        ),
        selectionPaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _YgChartEventRailPainter oldDelegate) {
    return !listEquals(oldDelegate.events, events) ||
        oldDelegate.bandCount != bandCount ||
        oldDelegate.trackColor != trackColor ||
        oldDelegate.defaultEventColor != defaultEventColor ||
        oldDelegate.selectionColor != selectionColor ||
        oldDelegate.selectedBand != selectedBand;
  }
}
