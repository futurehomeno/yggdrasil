import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:yggdrasil/src/components/yg_graph/models/_models.dart';

typedef _Yg2DGraphChildren = ({
  RenderBox? topAxis,
  RenderBox? rightAxis,
  RenderBox? bottomAxis,
  RenderBox? leftAxis,
  RenderBox? hoverDecoration,
  List<RenderBox> graphs,
});

class Yg2DGraph extends MultiChildRenderObjectWidget {
  const Yg2DGraph({
    super.key,
    required super.children,
    required this.indexRange,
    required this.valueRange,
  });

  final Range? indexRange;
  final Range? valueRange;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _Yg2DGraphRenderer();
  }
}

class Yg2DGraphParentData extends ContainerBoxParentData<RenderBox> {}

class _Yg2DGraphRenderer extends RenderBox
    with
        ContainerRenderObjectMixin<RenderBox, Yg2DGraphParentData>,
        RenderBoxContainerDefaultsMixin<RenderBox, Yg2DGraphParentData> {
  _Yg2DGraphRenderer();

  _Yg2DGraphChildren get _namedChildren {}
}
