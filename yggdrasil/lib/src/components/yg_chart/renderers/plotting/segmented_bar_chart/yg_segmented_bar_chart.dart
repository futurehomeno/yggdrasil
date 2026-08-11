import 'package:flutter/widgets.dart';
import 'package:yggdrasil/src/components/yg_chart/controller/yg_chart_data_set_controller.dart';
import 'package:yggdrasil/src/components/yg_chart/enums/data_group.dart';
import 'package:yggdrasil/src/components/yg_chart/renderers/plotting/segmented_bar_chart/tweens/segmented_bar_chart_data_tween.dart';
import 'package:yggdrasil/src/components/yg_chart/renderers/plotting/segmented_bar_chart/yg_segmented_bar_chart_render_widget.dart';
import 'package:yggdrasil/src/components/yg_chart/widgets/yg_chart_plotting_widget.dart';

import 'models/segmented_bar_chart_data.dart';

class YgSegmentedBarChart extends StatelessWidget {
  const YgSegmentedBarChart({
    super.key,
    required this.data,
    this.group = DataGroup.primary,
  });

  final SegmentedBarChartData data;
  final DataGroup group;

  @override
  Widget build(BuildContext context) {
    return YgChartPlottingWidget<SegmentedBarChartData>(
      data: data,
      group: group,
      tweenBuilder: (SegmentedBarChartData? start, SegmentedBarChartData? end) => SegmentedBarChartDataTween(
        begin: start,
        end: end,
      ),
      builder: (YgChartDatasetController<SegmentedBarChartData> controller) {
        return YgSegmentedBarChartRenderWidget(
          controller: controller,
        );
      },
    );
  }
}
