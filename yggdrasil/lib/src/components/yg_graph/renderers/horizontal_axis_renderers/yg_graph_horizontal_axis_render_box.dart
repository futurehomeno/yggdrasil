import 'package:flutter/rendering.dart';
import 'package:yggdrasil/src/components/yg_graph/enums/yg_horizontal_axis_alignment.dart';
import 'package:yggdrasil/src/components/yg_graph/models/_models.dart';
import 'package:yggdrasil/src/components/yg_graph/models/horizontal_edge_insets.dart';
import 'package:yggdrasil/src/components/yg_graph/models/transform_1d.dart';

class YgHorizontalAxisParentData extends ContainerBoxParentData<YgGraphHorizontalAxisRenderBox> {
  Transform1D valueTransform = Transform1D.zero;
  EdgeInsets contentPadding = EdgeInsets.zero;
  Range indexRange = Range.zero;
  YgHorizontalAxisAlignment alignment = YgHorizontalAxisAlignment.bottom;
}

abstract class YgGraphHorizontalAxisRenderBox extends RenderBox {
  double getMinLabelAreaHeight();

  HorizontalEdgeInsets getMinHorizontalPadding();

  YgHorizontalAxisAlignment getAlignment();
}
