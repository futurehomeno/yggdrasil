import 'package:flutter/widgets.dart';
import 'package:yggdrasil/src/components/yg_chart/interval_providers/interfaces/yg_interval_provider.dart';
import 'package:yggdrasil/src/components/yg_chart/models/formatters/yg_simple_value_formatter.dart';
import 'package:yggdrasil/src/components/yg_chart/models/formatters/yg_value_formatter.dart';

/// The base config class for an axis in a [YgChart].
abstract class YgAxisConfig {
  const YgAxisConfig({
    this.metric,
    this.widget,
    this.formatter = const YgSimpleValueFormatter(),
    this.interval = const YgNoIntervalProvider(),
  });

  /// The metric shown for this axis.
  ///
  /// This can be displayed on the axis it self and the tooltip.
  final String? metric;

  /// The widget responsible for rendering the axis.
  ///
  /// Not always needed, in case you want a graph that does not have visible
  /// labels.
  final Widget? widget;

  /// Formats the values for this axis.
  ///
  /// Formats the values for both the tooltip and any potential labels.
  final YgValueFormatter formatter;

  /// Provides an interval between values on this axis.
  ///
  /// Provides an interval which is used both by potential label painting
  /// widgets, as well as any grid decorators.
  final YgIntervalProvider interval;
}
