import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_chart/models/data_set.dart';
import 'package:yggdrasil/src/components/yg_chart/renderers/chart_child_widget.dart';

abstract class PlottingPainter<D extends AnyDataSet> extends ChartPainter<D> {
  const PlottingPainter();

  EdgeInsets getMiniumInsets() => EdgeInsets.zero;
}
