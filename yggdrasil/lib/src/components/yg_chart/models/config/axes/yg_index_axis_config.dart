import 'package:yggdrasil/src/components/yg_chart/interval_providers/interfaces/yg_interval_provider.dart';
import 'package:yggdrasil/src/components/yg_chart/models/config/axes/yg_axis_config.dart';
import 'package:yggdrasil/src/components/yg_chart/models/formatters/yg_simple_value_formatter.dart';
import 'package:yggdrasil/src/components/yg_chart/models/range.dart';

/// Configuration class for a index axis.
class YgIndexAxisConfig extends YgAxisConfig {
  const YgIndexAxisConfig({
    this.range,
    super.metric,
    super.widget,
    super.formatter = const YgSimpleValueFormatter(),
    super.interval = const YgNoIntervalProvider(),
  });

  /// The range of the axis.
  ///
  /// Might not always be fully adhered to. A plotter can attempt to restrict
  /// this range to ensure it can plot its data while adhering to the design
  /// requirements.
  final DoubleRange? range;
}
