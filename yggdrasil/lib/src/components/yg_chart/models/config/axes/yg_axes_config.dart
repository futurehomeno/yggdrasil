import 'package:yggdrasil/src/components/yg_chart/models/config/axes/yg_index_axes_config.dart';
import 'package:yggdrasil/src/components/yg_chart/models/config/axes/yg_value_axes_config.dart';

class YgAxesConfig {
  const YgAxesConfig({
    this.index = const YgIndexAxesConfig(),
    this.primary = const YgValueAxesConfig(),
    this.secondary = const YgValueAxesConfig(),
  });

  final YgIndexAxesConfig index;
  final YgValueAxesConfig primary;
  final YgValueAxesConfig secondary;
}
