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
  static const List<String> _hourLabels = <String>['00', '03', '06', '09', '12', '15', '18', '21'];

  final Random _random = Random();

  YgChartSize _selectedSize = YgChartSize.medium;

  late List<double> _heating = _randomValues(count: 7, max: 8.0);
  late List<double> _appliances = _randomValues(count: 7, max: 4.0);
  late List<double> _price = _randomValues(count: 7, max: 2.5, min: 0.5);

  late List<double> _consumption = _randomValues(count: 7, max: 6.0);
  late List<double> _production = _randomValues(count: 7, max: 5.0).map((double value) => -value).toList();

  late List<double> _power = _randomPowerProfile();
  late List<_PowerEvent> _powerEvents = _randomPowerEvents();

  /// The band selected on the event density rail of the power chart,
  /// rendered as a summary tile below it. The chart only reports the band
  /// under the pointer; the selection and the detail view are owned by the
  /// app.
  int? _selectedEventBand;

  /// Raw readings of the room temperature sensors, one list per sensor.
  ///
  /// The chart is only passed the precomputed band (average and min-max
  /// envelope); the raw readings stay in the app and are resolved by index
  /// in the tooltip.
  late List<List<double>> _roomSensors = _randomSensorValues();

  @override
  Widget build(BuildContext context) {
    final List<double> temperatureAverages = _aggregateSensors(
      (List<double> readings) => readings.reduce((double a, double b) => a + b) / readings.length,
    );
    final List<double> temperatureMinimums = _aggregateSensors((List<double> readings) => readings.reduce(min));
    final List<double> temperatureMaximums = _aggregateSensors((List<double> readings) => readings.reduce(max));

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
            YgSection.column(
              title: 'Charging power over a day (stepped area)',
              children: <Widget>[
                YgChart(
                  size: YgChartSize.small,
                  xLabels: _hourLabels,
                  tooltipBuilder: _buildTooltip,
                  railEvents: <YgChartRailEvent>[
                    for (final _PowerEvent event in _powerEvents)
                      YgChartRailEvent(
                        position: event.time,
                        color: event.color,
                      ),
                  ],
                  selectedRailBand: _selectedEventBand,
                  onRailBandSelected: (int band) => setState(() => _selectedEventBand = band),
                  series: <YgChartSeries>[
                    YgChartSeries(
                      id: 'power',
                      label: 'Power',
                      values: _power,
                      unit: 'kW',
                      type: YgChartSeriesType.steppedArea,
                    ),
                  ],
                ),
                if (_selectedEventBand != null) _buildSelectedBandTile(_selectedEventBand!),
                YgButton(
                  onPressed: () => setState(() {
                    _power = _randomPowerProfile();
                    _powerEvents = _randomPowerEvents();
                    _selectedEventBand = null;
                  }),
                  child: const Text('Randomize data'),
                ),
              ],
            ),
            YgSection.column(
              title: 'Temperature band (average of three sensors)',
              children: <Widget>[
                YgChart(
                  xLabels: _weekLabels,
                  tooltipBuilder: _buildTemperatureTooltip,
                  series: <YgChartSeries>[
                    YgChartSeries(
                      id: 'living-room',
                      label: 'Living room',
                      values: temperatureAverages,
                      lowerValues: temperatureMinimums,
                      upperValues: temperatureMaximums,
                      unit: '°C',
                      type: YgChartSeriesType.band,
                    ),
                  ],
                ),
                YgButton(
                  onPressed: _randomizeTemperatureData,
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
    final TextStyle textStyle = _tooltipTextStyle(context);

    return _tooltipFrame(
      context: context,
      xLabel: data.xLabel,
      rows: <Widget>[
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
    );
  }

  /// The shared chrome of the demo tooltips: an inverse rounded card with
  /// the pressed x-label as its header.
  Widget _tooltipFrame({
    required BuildContext context,
    required String xLabel,
    required List<Widget> rows,
  }) {
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
            xLabel,
            style: context.tokens.textStyles.caption1Bold.copyWith(
              color: context.tokens.colors.textInverse,
            ),
          ),
          ...rows,
        ],
      ),
    );
  }

  TextStyle _tooltipTextStyle(BuildContext context) {
    return context.tokens.textStyles.caption1Regular.copyWith(
      color: context.tokens.colors.textInverse,
    );
  }

  /// Tooltip of the temperature band: the average from the chart data plus
  /// the raw sensor readings the band was computed from.
  Widget _buildTemperatureTooltip(BuildContext context, YgChartTooltipData data) {
    if (data.entries.isEmpty) {
      return const SizedBox.shrink();
    }

    final YgChartTooltipEntry entry = data.entries.first;
    final TextStyle textStyle = _tooltipTextStyle(context);

    return _tooltipFrame(
      context: context,
      xLabel: data.xLabel,
      rows: <Widget>[
        Text(
          'Average: ${entry.value.toStringAsFixed(1)} ${entry.series.unit}',
          style: textStyle,
        ),
        for (int sensor = 0; sensor < _roomSensors.length; sensor++)
          Text(
            'Sensor ${sensor + 1}: ${_roomSensors[sensor][data.index].toStringAsFixed(1)} ${entry.series.unit}',
            style: textStyle,
          ),
      ],
    );
  }

  /// Summary of the events in the rail band selected on the power chart.
  Widget _buildSelectedBandTile(int band) {
    final List<_PowerEvent> bandEvents = _powerEvents.where((_PowerEvent event) => event.time.floor() == band).toList();
    final String bandEnd = band + 1 < _hourLabels.length ? _hourLabels[band + 1] : '24';

    return YgListTile(
      title: '${_hourLabels[band]}:00 – $bandEnd:00 · ${bandEvents.length} events',
      subtitle: bandEvents.isEmpty
          ? 'No events in this band'
          : bandEvents.map((_PowerEvent event) => event.type).toSet().join(' · '),
    );
  }

  /// Simulated charger events over the day, clustered around the charging
  /// session so the rail visibly varies in density.
  List<_PowerEvent> _randomPowerEvents() {
    const List<(String, Color?)> eventTypes = <(String, Color?)>[
      ('Charging', null),
      ('Suspended by ev', Color(0xffe0762a)),
      ('Ready to charge', Color(0xff3f9a68)),
    ];

    return List<_PowerEvent>.generate(60, (_) {
      final (String type, Color? color) = eventTypes[_random.nextInt(eventTypes.length)];
      final double time = _random.nextDouble() * (_random.nextInt(4) > 0 ? 5.0 : _hourLabels.length.toDouble());

      return _PowerEvent(time: time, type: type, color: color);
    });
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

  void _randomizeTemperatureData() {
    setState(() => _roomSensors = _randomSensorValues());
  }

  /// A charging-like power profile: idle most of the time with a few flat
  /// high-power plateaus, so the step look is clearly visible.
  List<double> _randomPowerProfile() {
    return List<double>.generate(
      _hourLabels.length,
      (_) => _random.nextBool() ? 0.2 + _random.nextDouble() * 0.4 : 3.0 + _random.nextDouble() * 4.0,
    );
  }

  /// Simulated readings of three sensors following the same room trend,
  /// each with its own placement offset and noise.
  List<List<double>> _randomSensorValues() {
    final List<double> trend = _randomValues(count: 7, max: 24.0, min: 21.0);

    return List<List<double>>.generate(
      3,
      (int sensor) =>
          trend.map((double value) => value + (sensor - 1) * 0.3 + (_random.nextDouble() - 0.5) * 0.8).toList(),
    );
  }

  /// Reduces the sensor readings of each day to a single value, building the
  /// band data the way an app is expected to: precomputed, one value per
  /// x-axis label.
  List<double> _aggregateSensors(double Function(List<double> readings) aggregate) {
    return List<double>.generate(
      _weekLabels.length,
      (int index) => aggregate(
        _roomSensors.map((List<double> sensor) => sensor[index]).toList(),
      ),
    );
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

/// One simulated charger event shown on the event density rail.
class _PowerEvent {
  const _PowerEvent({
    required this.time,
    required this.type,
    this.color,
  });

  /// Position on the x-axis in column units (three hours per column).
  final double time;

  final String type;

  /// Own color of the event; null uses the default rail event color.
  final Color? color;
}
