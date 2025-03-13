import 'package:yggdrasil/src/components/yg_chart/models/config/axes/yg_index_axis_config.dart';
import 'package:yggdrasil/src/components/yg_chart/models/config/axes/yg_value_axis_config.dart';
import 'package:yggdrasil/src/components/yg_chart/models/config/yg_chart_controller_config.dart';
import 'package:yggdrasil/src/components/yg_chart/renderers/yg_chart_renderer.dart';

class YgAxesConfig {
  const YgAxesConfig({
    this.index = const YgIndexAxisConfig(),
    this.primary = const YgValueAxisConfig(),
    this.secondary = const YgValueAxisConfig(),
  });

  final YgIndexAxisConfig index;
  final YgValueAxisConfig primary;
  final YgValueAxisConfig secondary;

  YgChartControllerConfig get controllerConfig {
    return YgChartControllerConfig(
      indexRange: index.range,
      primaryRange: index.range,
      secondaryRange: index.range,
    );
  }

  ChartRenderData get renderData {
    return ChartRenderData(
      indexIntervalProvider: index.interval,
      primaryIntervalProvider: primary.interval,
      secondaryIntervalProvider: secondary.interval,
    );
  }
}
