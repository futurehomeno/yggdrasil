import 'package:flutter/rendering.dart';
import 'package:yggdrasil/src/components/yg_graph/models/_models.dart';

abstract class YgGraphFieldRenderBox extends RenderBox {
  Transform2D? _cachedTransform;

  @override
  void markNeedsLayout() {
    _cachedTransform = null;
    super.markNeedsLayout();
  }

  /// Returns a field offset from
  Offset getValueOffset(double point, double value) {
    final ParentData? parentData = this.parentData;
    if (parentData is! YgGraphFieldParentData) {
      throw Exception(
        'Invalid parent data! Make sure you are not using a YgGraph2D component outside of a YgGraph2D',
      );
    }

    Transform2D? transform = _cachedTransform;
    if (transform == null) {
      final EdgeInsets padding = parentData.contentPadding;
      final Range indexRange = parentData.indexRange;
      final Range valueRange = parentData.valueRange;

      final Size fieldSize = padding.deflateSize(size);

      transform = Transform2D(
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
    if (parentData is! YgGraphFieldParentData) {
      throw Exception(
        'Invalid parent data! Make sure you are not using a YgGraph2D component outside of a YgGraph2D',
      );
    }

    return parentData.contentPadding;
  }

  EdgeInsets getMinContentPadding();

  Range getIndexRange();

  Range getValueRange();
}

class YgGraphFieldParentData extends ContainerBoxParentData<YgGraphFieldRenderBox> {
  Transform2D valueTransform = Transform2D.zero;
  EdgeInsets contentPadding = EdgeInsets.zero;
  Range valueRange = Range.zero;
  Range indexRange = Range.zero;
}
