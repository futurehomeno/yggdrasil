import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:yggdrasil/src/components/yg_graph/renderers/field_renderers/yg_graph_field_render_box.dart';

typedef _Yg2DGraphChildren = ({
  RenderBox? topAxis,
  RenderBox? rightAxis,
  RenderBox? bottomAxis,
  RenderBox? leftAxis,
  RenderBox? hoverDecoration,
  List<RenderBox> graphs,
});

class Yg2DGraph extends MultiChildRenderObjectWidget {
  Yg2DGraph({
    super.key,
    required Widget? topAxis,
    required Widget? rightAxis,
    required Widget? bottomAxis,
    required Widget? leftAxis,
    required Widget? hoverDecoration,
    required List<Widget> graphs,
  })  : _childData = NullableItemListSplitterMerger<Widget>(
          list: <Widget?>[
            topAxis,
            rightAxis,
            bottomAxis,
            leftAxis,
            hoverDecoration,
            ...graphs,
          ],
        ),
        super(
          children: _childData.nonNullList,
        );

  final NullableItemListSplitterMerger<Widget> _childData;
  final Range? indexRange;
  final Range? valueRange;
  

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _Yg2DGraphRenderer(
      childData: _childData,
    );
  }
}

class Yg2DGraphParentData extends ContainerBoxParentData<RenderBox> {}

class _Yg2DGraphRenderer extends RenderBox
    with
        ContainerRenderObjectMixin<RenderBox, Yg2DGraphParentData>,
        RenderBoxContainerDefaultsMixin<RenderBox, Yg2DGraphParentData> {
  _Yg2DGraphRenderer({
    required NullableItemListSplitterMerger<Widget> childData,
  }) : _childData = childData;

  NullableItemListSplitterMerger<Widget> _childData;
  NullableItemListSplitterMerger<Widget> get childData => _childData;
  set childData(NullableItemListSplitterMerger<Widget> newValue) {
    if (_childData != newValue) {
      _childData = newValue;
      markNeedsLayout();
    }
  }

  _Yg2DGraphChildren get _namedChildren {
    final List<RenderBox> children = getChildrenAsList();
    final List<RenderBox?> childrenWithNull = _childData.getListWithNulls(children);
    final [
      RenderBox? topAxis,
      RenderBox? rightAxis,
      RenderBox? bottomAxis,
      RenderBox? leftAxis,
      RenderBox? hoverDecoration,
      ...List<RenderBox?> graphs,
    ] = childrenWithNull;

    return (
      topAxis: topAxis,
      rightAxis: rightAxis,
      bottomAxis: bottomAxis,
      leftAxis: leftAxis,
      hoverDecoration: hoverDecoration,
      graphs: graphs.whereType<RenderBox>().toList(),
    );
  }
}

/// Splits nulls from a list and merge them back in to a processed list.
///
/// Useful when a processing class can not handle null items, but null items
/// need to be preserved for the processed result.
///
/// One example where this is common is [MultiChildRenderObjectWidget]s which
/// require their optional named child widgets to be accessed in [RenderObject]s
/// as named child [RenderObject]s.
class NullableItemListSplitterMerger<T> {
  const NullableItemListSplitterMerger({
    required this.list,
  });

  /// List with nullable items.
  final List<T?> list;

  /// List without nullable items.
  List<T> get nonNullList {
    final List<T> nonNullList = <T>[];
    for (final T? item in list) {
      if (item != null) {
        nonNullList.add(item);
      }
    }

    return nonNullList;
  }

  /// Merges nulls from the [list] in to [newList].
  List<R?> getListWithNulls<R>(List<R> newList) {
    final List<R?> listWithNull = <R?>[];

    int index = 0;
    for (final T? item in list) {
      if (item == null) {
        listWithNull.add(null);
        continue;
      }

      listWithNull.add(newList[index]);
      index++;
    }

    return listWithNull;
  }
}
