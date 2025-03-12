import 'package:flutter/src/animation/tween.dart';
import 'package:yggdrasil/src/components/yg_chart/painters/plotting/line_chart/line_chart_data.dart';

class LineChartDataTween extends Tween<LineChartData> {
  LineChartDataTween({
    super.begin,
    super.end,
  });

  @override
  LineChartData lerp(double t) {
    // TODO: Add real interpolation.
    // Maybe create a new set of points which contains indexes of both sets of
    // data, initialize with interpolated values?

    if (t > 0.5) {
      return (end ?? begin)!;
    }

    return (begin ?? end)!;
  }
}
