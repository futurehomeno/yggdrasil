import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:yggdrasil/src/components/yg_chart/models/data/dataset.dart';
import 'package:yggdrasil/src/components/yg_chart/renderers/chart_child_renderer.dart';
import 'package:yggdrasil/src/components/yg_chart/renderers/chart_painting_context.dart';
import 'package:yggdrasil/src/components/yg_chart/renderers/horizontal_axis_renderer.dart';

class LabelAxis extends HorizontalAxisWidget {
  const LabelAxis({
    super.key,
    required super.intervalProvider,
  });
}

class LabelAxisPainter extends HorizontalAxisPainter<AnyDataset> {


  @override
  void paint(Canvas canvas, ChartPaintingContext context, AnyDataset data) {
    SliverList
  }
}
