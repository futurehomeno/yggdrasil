import 'package:flutter/rendering.dart';
import 'package:yggdrasil/src/components/yg_graph/enums/yg_horizontal_axis_alignment.dart';
import 'package:yggdrasil/src/components/yg_graph/models/_models.dart';
import 'package:yggdrasil/src/components/yg_graph/models/transform_1d.dart';

class YgHorizontalAxisParentData extends ContainerBoxParentData<YgHorizontalAxisRenderBox> {
  Transform1D valueTransform = Transform1D.zero;
  EdgeInsets coordinatePadding = EdgeInsets.zero;
  Range indexRange = Range.zero;
  YgHorizontalAxisAlignment alignment = YgHorizontalAxisAlignment.left;
}

abstract class YgHorizontalAxisRenderBox extends RenderBox {}
