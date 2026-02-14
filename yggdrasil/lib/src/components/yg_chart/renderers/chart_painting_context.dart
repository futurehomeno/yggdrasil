import 'package:flutter/widgets.dart';
import 'package:yggdrasil/src/components/yg_chart/models/range.dart';
import 'package:yggdrasil/src/components/yg_chart/models/transform_2d.dart';
import 'package:yggdrasil/src/components/yg_chart/renderers/chart_state.dart';

class ChartPaintingContext {
  ChartPaintingContext({
    required this.padding,
    required this.size,
    required this.state,
  });

  final ChartState state;
  final Size size;
  final EdgeInsets padding;

  Transform2D? _cachedTransform;

  Offset getValueCoordinates(double index, double value) {
    Transform2D? transform = _cachedTransform;
    if (transform == null) {
      final DoubleRange indexRange = state.indexRange;
      final DoubleRange valueRange = state.valueRange;

      final Size fieldSize = padding.deflateSize(size);

      transform = Transform2D(
        xScale: indexRange.length / fieldSize.width,
        yScale: valueRange.length / fieldSize.height,
        xOffset: padding.left - (indexRange.start * indexRange.length / fieldSize.width),
        yOffset: padding.top - (valueRange.start * valueRange.length / fieldSize.height),
      );
      _cachedTransform = transform;
    }

    return transform.apply(
      index,
      value,
    );
  }
}
