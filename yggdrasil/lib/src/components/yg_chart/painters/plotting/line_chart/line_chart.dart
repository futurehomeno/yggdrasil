import 'dart:ui';

import 'package:flutter/src/animation/tween.dart';
import 'package:yggdrasil/src/components/yg_chart/painters/plotting/line_chart/line_chart_data.dart';
import 'package:yggdrasil/src/components/yg_chart/painters/plotting/line_chart/line_chart_data_tween.dart';
import 'package:yggdrasil/src/components/yg_chart/renderers/chart_child_widget.dart';
import 'package:yggdrasil/src/components/yg_chart/renderers/plotting/plotting_painter.dart';
import 'package:yggdrasil/src/components/yg_chart/renderers/plotting/plotting_widget.dart';

class LineChart extends PlottingWidget<LineChartData> {
  const LineChart({
    super.key,
    required super.dataSet,
  });

  @override
  PlottingPainter<LineChartData> createPainter() {
    return const LineChartPainter();
  }

  @override
  Tween<LineChartData> createTween(
    LineChartData begin,
    LineChartData end,
  ) {
    return LineChartDataTween(
      begin: begin,
      end: end,
    );
  }
}

class LineChartPainter extends PlottingPainter<LineChartData> {
  const LineChartPainter();

  @override
  void paint(Canvas canvas, ChartPaintingContext context, LineChartData data) {
    // TODO: implement paint
  }
}
