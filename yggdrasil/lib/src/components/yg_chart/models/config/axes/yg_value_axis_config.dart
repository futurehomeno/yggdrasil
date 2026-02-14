import 'package:yggdrasil/src/components/yg_chart/interval_providers/interfaces/yg_interval_provider.dart';
import 'package:yggdrasil/src/components/yg_chart/models/config/axes/yg_axis_config.dart';
import 'package:yggdrasil/src/components/yg_chart/models/formatters/yg_simple_value_formatter.dart';

/// Configuration class for a value axis.
class YgValueAxisConfig extends YgAxisConfig {
  const YgValueAxisConfig({
    super.metric,
    super.widget,
    this.alwaysIncludeOrigin = true,
    super.formatter = const YgSimpleValueFormatter(),
    super.interval = const YgNoIntervalProvider(),
  });

  /// Ensures the origin (0) gets included in the range of this axis.
  ///
  /// When set to false, a graph may start at a value other than 0, this could
  /// be useful when showing relatively small changes over a dataset.
  final bool alwaysIncludeOrigin;
}
