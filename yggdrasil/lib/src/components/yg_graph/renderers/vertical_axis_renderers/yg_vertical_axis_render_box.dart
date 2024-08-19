import 'package:flutter/rendering.dart';
import 'package:yggdrasil/src/components/yg_graph/enums/yg_vertical_axis_alignment.dart';
import 'package:yggdrasil/src/components/yg_graph/models/_models.dart';
import 'package:yggdrasil/src/components/yg_graph/models/transform_1d.dart';

class YgVerticalAxisParentData extends ContainerBoxParentData<YgVerticalAxisRenderBox> {
  Transform1D valueTransform = Transform1D.zero;
  EdgeInsets coordinatePadding = EdgeInsets.zero;
  Range valueRange = Range.zero;
  YgVerticalAxisAlignment alignment = YgVerticalAxisAlignment.left;
}

abstract class YgVerticalAxisRenderBox extends RenderBox {}
