import 'package:flutter/rendering.dart';
import 'package:yggdrasil/src/components/yg_graph/models/_models.dart';

class GraphFieldData {
  const GraphFieldData({
    required this.valueRange,
    required this.indexRange,
  });

  static const GraphFieldData zero = GraphFieldData(
    indexRange: Range.zero,
    valueRange: Range.zero,
  );

  final Range valueRange;
  final Range indexRange;
}

mixin YgGraphFieldMixin on RenderBox {
  Transform? _cachedTransform;

  @override
  void markNeedsLayout() {
    _cachedTransform = null;
    super.markNeedsLayout();
  }

  /// Returns a field offset from
  Offset getCoordinatesFromValue(double point, double value) {
    final ParentData? parentData = this.parentData;
    if (parentData is! YgGraphFieldParentDataMixin) {
      throw Exception(
        'Invalid parent data! Make sure you are not using a YgGraph2D component outside of a YgGraph2D',
      );
    }

    Transform? transform = _cachedTransform;
    if (transform == null) {
      final EdgeInsets padding = parentData.coordinatePadding;
      final Range indexRange = parentData.graphFieldData.indexRange;
      final Range valueRange = parentData.graphFieldData.valueRange;

      final Size fieldSize = padding.deflateSize(size);

      transform = Transform(
        xScale: indexRange.length / fieldSize.width,
        yScale: valueRange.length / fieldSize.height,
        xOffset: padding.left - (indexRange.start * indexRange.length / fieldSize.width),
        yOffset: padding.top - (valueRange.start * valueRange.length / fieldSize.height),
      );
      _cachedTransform = transform;
    }

    return transform.apply(point, value);
  }

  /// The padding applied to the coordinates used by all graph components.
  EdgeInsets get fieldPadding {
    final ParentData? parentData = this.parentData;
    if (parentData is! YgGraphFieldParentDataMixin) {
      throw Exception(
        'Invalid parent data! Make sure you are not using a YgGraph2D component outside of a YgGraph2D',
      );
    }

    return parentData.coordinatePadding;
  }

  EdgeInsets getMinimumCoordinatePadding();
}

mixin YgGraphFieldParentDataMixin on ContainerBoxParentData<YgGraphFieldMixin> {
  EdgeInsets coordinatePadding = EdgeInsets.zero;
  GraphFieldData graphFieldData = GraphFieldData.zero;
}
