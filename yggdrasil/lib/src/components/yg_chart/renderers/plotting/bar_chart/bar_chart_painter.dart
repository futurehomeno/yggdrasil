import 'dart:ui';

import 'package:flutter/src/animation/tween.dart';
import 'package:yggdrasil/src/components/yg_chart/renderers/chart_child_renderer.dart';
import 'package:yggdrasil/src/components/yg_chart/renderers/chart_painting_context.dart';
import 'package:yggdrasil/src/components/yg_chart/renderers/plotting/bar_chart/bar_chart_data.dart';
import 'package:yggdrasil/src/components/yg_chart/renderers/plotting/plotting_painter.dart';
import 'package:yggdrasil/src/components/yg_chart/renderers/plotting/plotting_widget.dart';

class BarChart extends PlottingWidget<BarChartData> {
  const BarChart({
    super.key,
    required super.dataSet,
  });

  @override
  PlottingPainter<BarChartData> createPainter() {
    return const BarChartPainter();
  }

  @override
  Tween<BarChartData> createTween(
    BarChartData begin,
    BarChartData end,
  ) {
    return BarChartTween(
      begin: begin,
      end: end,
    );
  }
}

class BarChartPainter extends PlottingPainter<BarChartData> {
  const BarChartPainter();

  @override
  void paint(Canvas canvas, ChartPaintingContext context, BarChartData data) {
    // TODO: implement paint
  }
}

class BarChartTween extends Tween<BarChartData> {
  BarChartTween({
    required super.begin,
    required super.end,
  });

  @override
  BarChartData lerp(double t) {
    // TODO: Add real interpolation.

    if (t > 0.5) {
      return (end ?? begin)!;
    }

    return (begin ?? end)!;
  }
}
