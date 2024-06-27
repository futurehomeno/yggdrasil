import 'package:yggdrasil/src/components/yg_mini_bar_graph/enums/_enums.dart';

/// A bar rendered in the [YgMiniBarGraph].
class YgBarGraphBar {
  const YgBarGraphBar({
    this.variant,
    required this.value,
    required this.valueText,
    required this.metric,
  });

  /// The variant of the bar.
  ///
  /// Primarily determines the color of the bar. If null, a fallback color is
  /// used instead of a color from the available [BarVariant]s.
  final BarVariant? variant;

  /// The value used for rendering the bar.
  ///
  /// This value is not displayed anywhere in text form. Setting the displayed
  /// text should instead be done using the [valueText].
  final double value;

  /// The value displayed when this bar is the current bar.
  final String valueText;

  /// The metric displayed when this bar is the current bar.
  final String metric;
}
