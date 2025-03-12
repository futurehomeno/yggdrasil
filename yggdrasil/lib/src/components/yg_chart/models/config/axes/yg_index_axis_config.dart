import 'package:yggdrasil/src/components/yg_chart/interval_providers/interfaces/yg_interval_provider.dart';
import 'package:yggdrasil/src/components/yg_chart/models/config/axes/yg_axis_config.dart';
import 'package:yggdrasil/src/components/yg_chart/models/formatters/yg_simple_value_formatter.dart';

class YgIndexAxisConfig extends YgAxisConfig {
  const YgIndexAxisConfig({
    super.metric,
    super.range,
    super.widget,
    super.formatter = const YgSimpleValueFormatter(),
    super.interval = const YgNoIntervalProvider(),
  });
}
