import 'dart:ui';

import 'package:flutter/animation.dart';
import 'package:yggdrasil/src/components/yg_chart/painters/plotting/segmented_bar_chart/segmented_bar_chart_data.dart';
import 'package:yggdrasil/src/components/yg_chart/painters/plotting/segmented_bar_chart/tweens/segmented_bar_chart_data_tween.dart';
import 'package:yggdrasil/src/components/yg_chart/renderers/chart_child_widget.dart';
import 'package:yggdrasil/src/components/yg_chart/renderers/plotting/plotting_painter.dart';
import 'package:yggdrasil/src/components/yg_chart/renderers/plotting/plotting_renderer.dart';

class SegmentedBarChart extends PlottingWidget<SegmentedBarChartData> {
  const SegmentedBarChart({
    super.key,
    required super.dataSet,
  });

  @override
  Tween<SegmentedBarChartData> createTween(
    SegmentedBarChartData begin,
    SegmentedBarChartData end,
  ) {
    return SegmentedBarChartDataTween(
      begin: begin,
      end: end,
    );
  }

  @override
  PlottingPainter<SegmentedBarChartData> createPainter() {
    // TODO: implement createPainter
    throw UnimplementedError();
  }
}

class SegmentedBarChartPainter extends PlottingPainter<SegmentedBarChartData> {
  const SegmentedBarChartPainter();

  @override
  void paint(Canvas canvas, ChartPaintingContext context, SegmentedBarChartData data) {
    // TODO: implement paint
  }
}
