import 'dart:math';

import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class ChartScreen extends StatefulWidget {
  const ChartScreen({super.key});

  static const String routeName = 'ChartScreen';

  static PageRouteBuilder<Widget> route() {
    return const YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const ChartScreen(),
    );
  }

  @override
  State<ChartScreen> createState() => _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen> {
  static const List<String> _weekLabels = <String>['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  static const List<String> _monthLabels = <String>['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'];

  final Random _random = Random();

  YgChartSize _selectedSize = YgChartSize.medium;

  late List<double> _heating = _randomValues(count: 7, max: 8.0);
  late List<double> _appliances = _randomValues(count: 7, max: 4.0);
  late List<double> _price = _randomValues(count: 7, max: 2.5, min: 0.5);

  late List<double> _consumption = _randomValues(count: 7, max: 6.0);
  late List<double> _production = _randomValues(count: 7, max: 5.0).map((double value) => -value).toList();

  @override
  Widget build(BuildContext context) {
    return DemoScreen(
      componentName: 'Chart',
      child: YgLayoutBody(
        child: Column(
          children: <Widget>[
            YgSection.column(
              title: 'Consumption and price on two axes',
              children: <Widget>[
                YgSegmentedButton<YgChartSize>(
                  segments: <YgButtonSegment<YgChartSize>>[
                    for (final YgChartSize size in YgChartSize.values)
                      YgButtonSegment<YgChartSize>(
                        label: size.name,
                        value: size,
                      ),
                  ],
                  value: _selectedSize,
                  onValueChanged: (YgChartSize newSize) => setState(() => _selectedSize = newSize),
                ),
                const SizedBox(height: 10.0),
                YgChart(
                  size: _selectedSize,
                  xLabels: _weekLabels,
                  tooltipBuilder: _buildTooltip,
                  series: <YgChartSeries>[
                    YgChartSeries(
                      id: 'heating',
                      label: 'Heating',
                      values: _heating,
                      unit: 'kWh',
                    ),
                    YgChartSeries(
                      id: 'appliances',
                      label: 'Appliances',
                      values: _appliances,
                      unit: 'kWh',
                    ),
                    YgChartSeries(
                      id: 'price',
                      label: 'Price',
                      values: _price,
                      unit: 'kr',
                      type: YgChartSeriesType.line,
                      axis: YgChartAxis.right,
                    ),
                  ],
                ),
                YgButton(
                  onPressed: _randomizeEnergyData,
                  child: const Text('Randomize data'),
                ),
              ],
            ),
            YgSection.column(
              title: 'Negative values (production below zero)',
              children: <Widget>[
                YgChart(
                  xLabels: _weekLabels,
                  tooltipBuilder: _buildTooltip,
                  series: <YgChartSeries>[
                    YgChartSeries(
                      id: 'consumption',
                      label: 'Consumption',
                      values: _consumption,
                      unit: 'kWh',
                    ),
                    YgChartSeries(
                      id: 'production',
                      label: 'Production',
                      values: _production,
                      unit: 'kWh',
                    ),
                  ],
                ),
                YgButton(
                  onPressed: _randomizeProductionData,
                  child: const Text('Randomize data'),
                ),
              ],
            ),
            YgSection(
              title: 'Automatic color assignment (tap legend to toggle)',
              child: YgChart(
                size: YgChartSize.large,
                xLabels: _monthLabels,
                series: <YgChartSeries>[
                  for (int i = 0; i < 6; i++)
                    YgChartSeries(
                      id: 'room-$i',
                      label: 'Room ${i + 1}',
                      values: List<double>.generate(
                        _monthLabels.length,
                        (int index) => 1.0 + i + sin((index + i) * 1.3),
                      ),
                      unit: 'kWh',
                      type: YgChartSeriesType.line,
                    ),
                ],
              ),
            ),
            const YgSection(
              title: 'Explicit series colors',
              child: YgChart(
                size: YgChartSize.small,
                xLabels: _weekLabels,
                series: <YgChartSeries>[
                  YgChartSeries(
                    id: 'consumption',
                    label: 'Consumption',
                    values: <double>[4.0, 6.0, 5.0, 8.0, 7.0, 3.0, 2.0],
                    unit: 'kWh',
                    color: Color(0xff02a8f1),
                  ),
                  YgChartSeries(
                    id: 'price',
                    label: 'Price',
                    values: <double>[0.8, 1.2, 2.4, 1.6, 0.9, 0.5, 0.7],
                    unit: 'kr',
                    type: YgChartSeriesType.line,
                    axis: YgChartAxis.right,
                    color: Color(0xfff9470b),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Tooltip with one row per visible series, long press a chart to see it.
  Widget _buildTooltip(BuildContext context, YgChartTooltipData data) {
    final TextStyle textStyle = context.tokens.textStyles.caption1Regular.copyWith(
      color: context.tokens.colors.textInverse,
    );

    return Container(
      margin: const EdgeInsets.all(5.0),
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      decoration: BoxDecoration(
        color: context.tokens.colors.backgroundInverse,
        borderRadius: context.tokens.radii.xs,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            data.xLabel,
            style: context.tokens.textStyles.caption1Bold.copyWith(
              color: context.tokens.colors.textInverse,
            ),
          ),
          for (final YgChartTooltipEntry entry in data.entries)
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  width: 8.0,
                  height: 8.0,
                  decoration: BoxDecoration(
                    color: entry.series.color,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 5.0),
                Text(
                  '${entry.series.label}: ${entry.value.toStringAsFixed(1)} ${entry.series.unit}',
                  style: textStyle,
                ),
              ],
            ),
        ],
      ),
    );
  }

  void _randomizeEnergyData() {
    setState(() {
      // Occasionally spike the consumption so the axis range visibly
      // animates to a new scale.
      final double maxHeating = _random.nextBool() ? 8.0 : 40.0;
      _heating = _randomValues(count: 7, max: maxHeating);
      _appliances = _randomValues(count: 7, max: 4.0);
      _price = _randomValues(count: 7, max: 2.5, min: 0.5);
    });
  }

  void _randomizeProductionData() {
    setState(() {
      _consumption = _randomValues(count: 7, max: 6.0);
      _production = _randomValues(count: 7, max: 5.0).map((double value) => -value).toList();
    });
  }

  List<double> _randomValues({
    required int count,
    required double max,
    double min = 0.0,
  }) {
    return List<double>.generate(
      count,
      (_) => min + _random.nextDouble() * (max - min),
    );
  }
}
