import 'package:flutter/rendering.dart';
import 'package:yggdrasil/src/components/yg_graph/enums/yg_vertical_axis_alignment.dart';
import 'package:yggdrasil/src/components/yg_graph/models/_models.dart';
import 'package:yggdrasil/src/components/yg_graph/models/transform_1d.dart';
import 'package:yggdrasil/src/components/yg_graph/models/vertical_edge_insets.dart';

class YgGraphVerticalAxisParentData extends ContainerBoxParentData<YgGraphVerticalAxisRenderBox> {
  Transform1D valueTransform = Transform1D.zero;
  EdgeInsets contentPadding = EdgeInsets.zero;
  Range valueRange = Range.zero;
  YgVerticalAxisAlignment alignment = YgVerticalAxisAlignment.left;
}

abstract class YgGraphVerticalAxisRenderBox extends RenderBox {
  double getMin();

  VerticalEdgeInsets getMinVerticalPadding();

  YgVerticalAxisAlignment getAlignment();

  double getMinIntrinsicFieldHeightWithIntervals();
}
