import 'package:flutter/src/animation/tween.dart';
import 'package:yggdrasil/src/components/yg_chart/renderers/plotting/bar_chart/models/bar_chart_data.dart';

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
