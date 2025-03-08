import 'package:flutter/widgets.dart';
import 'package:yggdrasil/src/components/yg_chart/models/data_point.dart';
import 'package:yggdrasil/src/components/yg_chart/models/range.dart';
import 'package:yggdrasil/src/components/yg_chart/models/transform_2d.dart';

import 'yg_chart_renderer.dart';

abstract class ChartChildWidget extends LeafRenderObjectWidget {
  const ChartChildWidget({super.key});

  @override
  ChartChildRenderer createRenderObject(BuildContext context);

  @protected
  void applyParentData(ChartChildRenderer renderObject);

  @override
  LeafRenderObjectElement createElement() => ChartChildElement(this);
}

class ChartChildElement extends LeafRenderObjectElement {
  ChartChildElement(super.widget);

  @override
  void update(ChartChildWidget newWidget) {
    assert(widget != newWidget);
    super.update(newWidget);
    assert(widget == newWidget);
    newWidget.applyParentData(renderObject as ChartChildRenderer);
  }
}

class ChartChildRenderer extends RenderBox {
  @override
  YgChartRendererParentData get parentData => super.parentData as YgChartRendererParentData;
}

abstract class ChartPainter<T extends PaintState<T>> implements Listenable {
  const ChartPainter({
    Listenable? repaint,
  }) : _repaint = repaint;

  final Listenable? _repaint;

  void paintState(ChartPaintingContext context, Canvas canvas);

  void createPaintState(ChartState chartState);

  @override
  void addListener(VoidCallback listener) {
    _repaint?.addListener(listener);
  }

  @override
  void removeListener(VoidCallback listener) {
    _repaint?.removeListener(listener);
  }
}

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

  Offset getPointCoordinates(DataPoint<num> point) {
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
      point.index,
      point.value,
    );
  }
}

class ChartState {
  const ChartState({
    required this.indexRange,
    required this.valueRange,
  });

  final DoubleRange indexRange;
  final DoubleRange valueRange;
}

abstract class PaintState<T extends PaintState<T>> {
  T lerpTo(T other, double t);

  bool shouldAnimate(ChartState other);
}
