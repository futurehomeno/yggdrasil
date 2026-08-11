import 'package:yggdrasil/src/components/yg_chart/models/config/axes/yg_index_axis_config.dart';
import 'package:yggdrasil/src/components/yg_chart/models/config/axes/yg_value_axis_config.dart';

class YgAxesConfig {
  const YgAxesConfig({
    this.index = const YgIndexAxisConfig(),
    this.primary = const YgValueAxisConfig(),
    this.secondary = const YgValueAxisConfig(),
  });

  final YgIndexAxisConfig index;
  final YgValueAxisConfig primary;
  final YgValueAxisConfig secondary;
}
