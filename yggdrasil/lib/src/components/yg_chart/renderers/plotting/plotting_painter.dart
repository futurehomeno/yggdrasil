import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_chart/models/data_set.dart';
import 'package:yggdrasil/src/components/yg_chart/renderers/chart_child_widget.dart';

abstract class PlottingPainter<D extends AnyDataSet, P extends PaintState<P>> extends ChartPainter<P> {
  const PlottingPainter({
    required this.dataSet,
  });

  final D dataSet;

  EdgeInsets getMiniumInsets() => EdgeInsets.zero;
}
