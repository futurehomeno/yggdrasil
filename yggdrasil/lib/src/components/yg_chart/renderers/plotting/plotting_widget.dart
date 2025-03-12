import 'package:flutter/widgets.dart';
import 'package:yggdrasil/src/components/yg_chart/models/data/data_set.dart';
import 'package:yggdrasil/src/components/yg_chart/renderers/chart_child_widget.dart';
import 'package:yggdrasil/src/components/yg_chart/renderers/plotting/plotting_painter.dart';

abstract class PlottingWidget<T extends AnyDataSet> extends ChartChildWidget {
  const PlottingWidget({
    super.key,
    required this.dataSet,
  });

  final T dataSet;

  @override
  void applyParentData(ChartChildRenderer renderObject) {
    renderObject.parentData.dataSet = dataSet;
  }

  @override
  ChartChildRenderer createRenderObject(BuildContext context) {
    return PlottingRenderer();
  }

  PlottingPainter<T> createPainter();

  Tween<T> createTween(T begin, T end);
}

class PlottingRenderer extends ChartChildRenderer {
  @override
  void performLayout() {}
}
