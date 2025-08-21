import 'package:flutter/rendering.dart';
import 'package:yggdrasil/src/components/yg_chart/controller/yg_chart_data_set_controller.dart';
import 'package:yggdrasil/src/components/yg_chart/models/data/dataset.dart';
import 'package:yggdrasil/src/components/yg_chart/models/range.dart';
import 'package:yggdrasil/src/components/yg_chart/models/transform_2d.dart';
import 'package:yggdrasil/src/components/yg_chart/renderers/chart_child_renderer.dart';
import 'package:yggdrasil/src/components/yg_chart/renderers/yg_chart_renderer.dart';

abstract class YgChartPlottingRenderer<T extends AnyDataset>
    extends ChartChildRenderer<YgChartPlottingRendererParentData> {
  YgChartPlottingRenderer({
    required YgChartDatasetController<T> controller,
  }) : _controller = controller;

  @override
  final bool sizedByParent = true;

  @override
  final bool isRepaintBoundary = true;

  YgChartDatasetController<T> _controller;
  YgChartDatasetController<T> get controller => _controller;
  set controller(YgChartDatasetController<T> controller) {
    if (_controller == controller) {
      return;
    }

    _controller.removeListener(markNeedsPaint);
    _controller = controller;
    _controller.addListener(markNeedsPaint);
  }

  EdgeInsets getMinPadding() => EdgeInsets.zero;

  double getMinIndexPixelScale() => 0;

  @override
  void attach(PipelineOwner owner) {
    controller.addListener(markNeedsPaint);
    super.attach(owner);
  }

  @override
  void detach() {
    super.detach();
    controller.removeListener(markNeedsPaint);
  }

  @override
  void dispose() {
    super.dispose();
    controller.removeListener(markNeedsPaint);
  }

  @override
  YgChartPlottingRendererParentData createParentData() {
    return YgChartPlottingRendererParentData();
  }

  @override
  Size computeDryLayout(covariant BoxConstraints constraints) {
    return constraints.biggest;
  }

  DoubleRange get indexRange => parentData.indexRange!;
  DoubleRange get valueRange => parentData.valueRange!;
  EdgeInsets get padding => parentData.padding!;

  Offset transform(double index, double value) {
    throw UnimplementedError();
    // return parentData.transform!.apply(index, value);
  }
}

class YgChartPlottingRendererParentData extends YgChartParentData {
  Transform2D? transform;
  DoubleRange? indexRange;
  DoubleRange? valueRange;
  EdgeInsets? padding;
}
