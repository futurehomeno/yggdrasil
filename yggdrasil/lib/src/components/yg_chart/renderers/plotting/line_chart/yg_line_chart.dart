import 'package:flutter/widgets.dart';
import 'package:yggdrasil/src/components/yg_chart/controller/yg_chart_data_set_controller.dart';
import 'package:yggdrasil/src/components/yg_chart/enums/data_group.dart';
import 'package:yggdrasil/src/components/yg_chart/renderers/plotting/line_chart/line_chart_data.dart';
import 'package:yggdrasil/src/components/yg_chart/renderers/plotting/line_chart/line_chart_data_tween.dart';
import 'package:yggdrasil/src/components/yg_chart/renderers/plotting/line_chart/yg_line_chart_render_widget.dart';
import 'package:yggdrasil/src/components/yg_chart/widgets/yg_chart_plotting_widget.dart';

class YgLineChart extends StatelessWidget {
  const YgLineChart({
    super.key,
    required this.data,
    this.group = DataGroup.primary,
  });

  final LineChartData data;
  final DataGroup group;

  @override
  Widget build(BuildContext context) {
    return YgChartPlottingWidget<LineChartData>(
      data: data,
      group: group,
      tweenBuilder: (LineChartData? start, LineChartData? end) => LineChartDataTween(
        begin: start,
        end: end,
      ),
      builder: (YgChartDatasetController<LineChartData> controller) {
        return YgLineChartRenderWidget(
          controller: controller,
        );
      },
    );
  }
}
