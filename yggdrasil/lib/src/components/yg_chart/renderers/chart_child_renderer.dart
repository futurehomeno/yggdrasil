import 'package:flutter/widgets.dart';

import 'yg_chart_renderer.dart';

abstract class ChartChildRenderer<T extends YgChartParentData> extends RenderBox {
  T createParentData();

  @override
  T get parentData => super.parentData as T;
}
