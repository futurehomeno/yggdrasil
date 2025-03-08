import 'dart:math';
import 'dart:ui';

import 'package:yggdrasil/src/components/yg_chart/enums/data_variant.dart';
import 'package:yggdrasil/src/components/yg_chart/painters/plotting/segmented_bar_chart/segmented_bar_chart_data.dart';
import 'package:yggdrasil/src/components/yg_chart/renderers/chart_child_widget.dart';
import 'package:yggdrasil/src/components/yg_chart/renderers/plotting/plotting_painter.dart';

class SegmentedBarChart extends PlottingPainter<SegmentedBarChartData, SegmentedBarChartState> {
  const SegmentedBarChart({
    required super.dataSet,
  });

  @override
  void paint(Canvas canvas) {
    // TODO: implement paint
  }
}

class SegmentedBarChartState extends PaintState<SegmentedBarChartState> {
  SegmentedBarChartState({
    required this.bars,
  });

  final List<Map<DataVariant, List<SegmentPaintData>>> bars;

  @override
  SegmentedBarChartState lerpTo(SegmentedBarChartState other, double t) {
    final List<Map<DataVariant, List<SegmentPaintData>>> interpolatedBars;

    for (int i = 0; i < bars.length; i++) {
      final Map<DataVariant, List<SegmentPaintData>> interpolatedSegmentsMap = <DataVariant, List<SegmentPaintData>>{};
      final Map<DataVariant, List<SegmentPaintData>> newSegmentsMap = other.bars[i];
      final Map<DataVariant, List<SegmentPaintData>> oldSegmentsMap = bars[i];

      for (final DataVariant variant in DataVariant.values) {
        final List<SegmentPaintData>? oldSegments = oldSegmentsMap[variant];
        final List<SegmentPaintData>? newSegments = newSegmentsMap[variant];

        final int mostSegments = max(
          oldSegments?.length ?? 0,
          newSegments?.length ?? 0,
        );

        if (mostSegments == 0) {
          continue;
        }

        final List<SegmentPaintData> interpolatedSegments = <SegmentPaintData>[];
        interpolatedSegmentsMap[variant] = interpolatedSegments;

        for (int i = 0; i < mostSegments; i++) {
          final SegmentPaintData? oldSegment = oldSegments?[i];
          final SegmentPaintData? newSegment = newSegments?[i];

          if (oldSegment == null) {}
        }
      }
    }

    // TODO: implement lerpTo
    throw UnimplementedError();
  }

  @override
  bool shouldAnimate(ChartState other) {
    // TODO: implement shouldAnimate
    throw UnimplementedError();
  }
}

class SegmentPaintData {
  const SegmentPaintData({
    required this.rrect,
    required this.variant,
  });

  final RRect rrect;
  final DataVariant variant;
}
