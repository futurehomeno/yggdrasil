import 'package:flutter/src/widgets/framework.dart';
import 'package:yggdrasil/src/components/yg_chart/interval_providers/interfaces/yg_interval_provider.dart';
import 'package:yggdrasil/src/components/yg_chart/models/data/data_set.dart';

import 'chart_child_widget.dart';

class HorizontalAxisWidget extends ChartChildWidget {
  const HorizontalAxisWidget({
    super.key,
    required this.intervalProvider,
  });

  final YgIntervalProvider? intervalProvider;

  @override
  void applyParentData(ChartChildRenderer renderObject) {
    // TODO: implement applyParentData
  }

  @override
  ChartChildRenderer createRenderObject(BuildContext context) {
    return HorizontalAxisRenderer();
  }
}

class HorizontalAxisRenderer extends ChartChildRenderer {}

abstract class HorizontalAxisPainter<D extends AnyDataSet> extends ChartPainter<D> {}
