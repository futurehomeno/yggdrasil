import 'dart:math';

import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_graph/interfaces/_interfaces.dart';
import 'package:yggdrasil/src/components/yg_graph/models/_models.dart';
import 'package:yggdrasil/src/components/yg_graph/renderers/field_renderers/yg_bar_graph/interfaces/yg_bar_style_provider.dart';
import 'package:yggdrasil/src/components/yg_graph/renderers/field_renderers/yg_bar_graph/models/yg_bar_style.dart';
import 'package:yggdrasil/src/components/yg_graph/renderers/field_renderers/yg_graph_field_render_box.dart';

class YgBarGraph<T extends YgGraphPoint> extends LeafRenderObjectWidget {
  const YgBarGraph({
    super.key,
    required this.dataProvider,
    required this.styleProvider,
  });

  final YgConstantIntervalGraphDataProvider<T> dataProvider;
  final YgBarStyleProvider<T> styleProvider;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return YgBarGraphRenderer<T>(
      dataProvider: dataProvider,
      styleProvider: styleProvider,
    );
  }

  @override
  void updateRenderObject(BuildContext context, covariant YgBarGraphRenderer renderObject) {
    renderObject.dataProvider = dataProvider;
    renderObject.styleProvider = styleProvider;
  }
}

class YgBarGraphRenderer<T extends YgGraphPoint> extends YgGraphFieldRenderBox {
  YgBarGraphRenderer({
    required YgConstantIntervalGraphDataProvider<T> dataProvider,
    required YgBarStyleProvider<T> styleProvider,
  })  : _dataProvider = dataProvider,
        _styleProvider = styleProvider;

  YgConstantIntervalGraphDataProvider<T> _dataProvider;
  YgConstantIntervalGraphDataProvider<T> get dataProvider => _dataProvider;
  set dataProvider(YgConstantIntervalGraphDataProvider<T> newValue) {
    if (_dataProvider != newValue) {
      _dataProvider = newValue;
      markNeedsPaint();
    }
  }

  YgBarStyleProvider<T> _styleProvider;
  YgBarStyleProvider<T> get styleProvider => _styleProvider;
  set styleProvider(YgBarStyleProvider<T> newValue) {
    if (_styleProvider != newValue) {
      _styleProvider = newValue;
      markNeedsPaint();
    }
  }

  @override
  EdgeInsets getMinimumCoordinatePadding() {
    // 2.5 for the bar with it self
    // 0.5 from the bar border.
    return const EdgeInsets.all(3);
  }

  @override
  void performLayout() {
    size = computeDryLayout(constraints);
  }

  @override
  Size computeDryLayout(covariant BoxConstraints constraints) {
    final double width;
    if (constraints.hasBoundedWidth) {
      width = constraints.maxWidth;
    } else {
      width = max(constraints.minWidth, 40.0);
    }

    final double height;
    if (constraints.hasBoundedHeight) {
      height = constraints.maxHeight;
    } else {
      height = max(constraints.minHeight, 40.0);
    }

    return Size(width, height);
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final double bottomPadding = fieldPadding.bottom;

    final Range range = _dataProvider.indexRange;
    const Offset topLeftOffset = Offset(-2.5, -2.5);

    final Paint paint = Paint();

    for (int i = range.start.ceil(); i < range.end; i++) {
      final T value = dataProvider.getDataAtDataPoint(i);
      final Offset topCenter = getCoordinatesFromValue(i.toDouble(), value.value);
      final YgBarStyle style = styleProvider.getBarStyleForData(value);

      final Rect rect = Rect.fromLTRB(
        topCenter.dx - 2.5,
        topCenter.dy - 2.5,
        topCenter.dx + 2.5,
        size.height - 3.0,
      );

      final RRect rrect = RRect.fromRectAndRadius(
        rect,
        const Radius.circular(2.5),
      );

      _barPaint.color = color;
      canvas.drawRRect(rrect, _barPaint);
      if (bars != null && bar == null) {
        final CircularIntervalList<double> dashArray = CircularIntervalList<double>(<double>[5, 2.5]);
        _borderPaint.color = theme.barBorderColorNull;

        final Path dashBorder = dashPath(
          Path()..addRRect(rrect),
          dashArray: dashArray,
        );

        canvas.drawPath(dashBorder, _borderPaint);
      }
    }
  }
}
