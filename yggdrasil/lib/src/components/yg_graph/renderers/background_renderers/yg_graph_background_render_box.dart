import 'package:flutter/rendering.dart';
import 'package:yggdrasil/src/components/yg_graph/models/transform_2d.dart';

class YgGraphBackgroundParentData extends ContainerBoxParentData<YgGraphBackgroundRenderBox> {
  Transform2D transform2d = Transform2D.zero;
  EdgeInsets contentPadding = EdgeInsets.zero;
}

class YgGraphBackgroundRenderBox extends RenderBox {}
