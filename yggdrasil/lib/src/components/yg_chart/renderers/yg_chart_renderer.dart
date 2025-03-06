import 'package:flutter/rendering.dart';
import 'package:yggdrasil/src/components/yg_chart/models/data_point.dart';
import 'package:yggdrasil/src/components/yg_chart/models/data_set.dart';

class YgChartRenderer extends RenderBox
    with
        ContainerRenderObjectMixin<RenderBox, YgChartRendererParentData>,
        RenderBoxContainerDefaultsMixin<RenderBox, YgChartRendererParentData> {}

class YgChartRendererParentData extends ContainerBoxParentData<RenderBox> {
  DataSet<num, DataPoint<num>>? dataSet;
}
