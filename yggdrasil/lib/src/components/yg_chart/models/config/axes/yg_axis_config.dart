import 'package:flutter/widgets.dart';
import 'package:yggdrasil/src/components/yg_chart/interval_providers/interfaces/yg_interval_provider.dart';
import 'package:yggdrasil/src/components/yg_chart/models/formatters/yg_simple_value_formatter.dart';
import 'package:yggdrasil/src/components/yg_chart/models/formatters/yg_value_formatter.dart';
import 'package:yggdrasil/src/components/yg_chart/models/range.dart';

abstract class YgAxisConfig {
  const YgAxisConfig({
    this.metric,
    this.range,
    this.widget,
    this.formatter = const YgSimpleValueFormatter(),
    this.interval = const YgNoIntervalProvider(),
  });

  final DoubleRange? range;
  final String? metric;
  final Widget? widget;
  final YgValueFormatter formatter;
  final YgIntervalProvider interval;
}
