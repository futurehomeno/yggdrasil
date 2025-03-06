import 'package:flutter/widgets.dart';
import 'package:yggdrasil/src/components/yg_chart/models/data_point.dart';
import 'package:yggdrasil/src/components/yg_chart/models/data_set.dart';
import 'package:yggdrasil/src/components/yg_chart/renderers/chart_child_widget.dart';
import 'package:yggdrasil/src/components/yg_chart/renderers/plotting/plotting_painter.dart';

abstract class PlottingWidget extends ChartChildWidget {
  const PlottingWidget({
    super.key,
    required this.dataSet,
  });

  final DataSet<num, DataPoint<num>> dataSet;

  @override
  void applyParentData(ChartChildRenderer renderObject) {
    renderObject.parentData.dataSet = dataSet;
  }

  @override
  ChartChildRenderer createRenderObject(BuildContext context) {
    return PlottingRenderer();
  }

  PlottingPainter createPainter();
}

class PlottingRenderer extends ChartChildRenderer {
  @override
  void performLayout() {}
}
