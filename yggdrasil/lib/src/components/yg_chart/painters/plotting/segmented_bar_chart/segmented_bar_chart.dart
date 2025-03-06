import 'dart:ui';

import 'package:yggdrasil/src/components/yg_chart/painters/plotting/segmented_bar_chart/segmented_bar_chart_data.dart';
import 'package:yggdrasil/src/components/yg_chart/renderers/chart_child_widget.dart';
import 'package:yggdrasil/src/components/yg_chart/renderers/plotting/plotting_painter.dart';

class SegmentedBarChart extends PlottingPainter<SegmentedBarChartData> {
  const SegmentedBarChart({
    required super.dataSet,
  });

  @override
  void paint(Canvas canvas) {
    // TODO: implement paint
  }
}

class SegmentedBarChartState extends PaintState<SegmentedBarChartState> {
  @override
  SegmentedBarChartState lerpTo(SegmentedBarChartState other, double t) {
    // TODO: implement lerpTo
    throw UnimplementedError();
  }

  @override
  bool shouldAnimate(ChartState other) {
    // TODO: implement shouldAnimate
    throw UnimplementedError();
  }
}
