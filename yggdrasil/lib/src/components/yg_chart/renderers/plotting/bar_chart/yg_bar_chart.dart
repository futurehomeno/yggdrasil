import 'package:flutter/widgets.dart';
import 'package:yggdrasil/src/components/yg_chart/controller/yg_chart_data_set_controller.dart';
import 'package:yggdrasil/src/components/yg_chart/enums/data_group.dart';
import 'package:yggdrasil/src/components/yg_chart/renderers/plotting/bar_chart/bar_chart_tween.dart';
import 'package:yggdrasil/src/components/yg_chart/renderers/plotting/bar_chart/models/bar_chart_data.dart';
import 'package:yggdrasil/src/components/yg_chart/renderers/plotting/bar_chart/yg_bar_chart_render_widget.dart';
import 'package:yggdrasil/src/components/yg_chart/widgets/yg_chart_plotting_widget.dart';

class YgBarChart extends StatelessWidget {
  const YgBarChart({
    super.key,
    required this.data,
    required this.group,
  });

  final BarChartData data;
  final DataGroup group;

  @override
  Widget build(BuildContext context) {
    return YgChartPlottingWidget<BarChartData>(
      data: data,
      group: group,
      tweenBuilder: (BarChartData? begin, BarChartData? end) => BarChartTween(
        begin: begin,
        end: end,
      ),
      builder: (YgChartDatasetController<BarChartData> controller) {
        return YgBarChartRenderWidget(
          controller: controller,
        );
      },
    );
  }
}
