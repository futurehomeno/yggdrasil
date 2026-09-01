import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class ChartContainerScreen extends StatelessWidget {
  const ChartContainerScreen({super.key});

  static const String routeName = 'ChartContainerScreen';

  static PageRouteBuilder<Widget> route() {
    return const YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const ChartContainerScreen(),
    );
  }

  static const List<String> _dayLabels = <String>['00:00', '06:00', '12:00', '18:00', '24:00'];

  static const List<String> _hourLabels = <String>[
    '00', '01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', //
    '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23',
  ];

  /// Power drawn per hour, peaking with the morning and evening heating.
  static const List<double> _powerValues = <double>[
    0.4, 0.3, 0.3, 0.3, 0.4, 0.6, 2.8, 3.4, 2.1, 1.2, 0.8, 0.9, //
    2.5, 1.4, 0.9, 0.8, 1.1, 2.2, 3.0, 3.6, 2.4, 1.3, 0.7, 0.5,
  ];

  static const List<YgStateTimelineSeries> _thermostatState = <YgStateTimelineSeries>[
    YgStateTimelineSeries(
      id: 'idle',
      label: 'Idle',
      ranges: <YgStateTimelineRange>[
        YgStateTimelineRange(start: 0.0, end: 6.0),
        YgStateTimelineRange(start: 9.0, end: 17.0),
        YgStateTimelineRange(start: 20.0, end: 24.0),
      ],
    ),
    YgStateTimelineSeries(
      id: 'heating',
      label: 'Heating',
      ranges: <YgStateTimelineRange>[
        YgStateTimelineRange(start: 6.0, end: 9.0),
        YgStateTimelineRange(start: 17.0, end: 20.0),
      ],
    ),
  ];

  static const List<YgStateTimelineSeries> _thermostatMode = <YgStateTimelineSeries>[
    YgStateTimelineSeries(
      id: 'heat',
      label: 'Heat',
      ranges: <YgStateTimelineRange>[
        YgStateTimelineRange(start: 0.0, end: 9.0),
        YgStateTimelineRange(start: 17.0, end: 24.0),
      ],
    ),
    YgStateTimelineSeries(
      id: 'eco',
      label: 'Eco',
      ranges: <YgStateTimelineRange>[
        YgStateTimelineRange(start: 9.0, end: 17.0),
      ],
    ),
  ];

  static const List<YgStateTimelineSeries> _consumption = <YgStateTimelineSeries>[
    YgStateTimelineSeries(
      id: 'consuming',
      label: 'Consuming',
      ranges: <YgStateTimelineRange>[
        YgStateTimelineRange(start: 6.0, end: 9.0),
        YgStateTimelineRange(start: 17.0, end: 20.0),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return const DemoScreen(
      componentName: 'ChartContainer',
      child: YgLayoutBody(
        child: Column(
          children: <Widget>[
            YgSection.column(
              title: 'Mixed chart and timelines, long press to scrub',
              children: <Widget>[
                YgChartContainer(
                  start: 0.0,
                  end: 24.0,
                  axisLabels: _dayLabels,
                  entries: <YgChartContainerEntry>[
                    YgChartContainerChart(
                      subtitle: 'Power',
                      xLabels: _hourLabels,
                      series: <YgChartSeries>[
                        YgChartSeries(
                          id: 'power',
                          label: 'Power',
                          values: _powerValues,
                          unit: 'kW',
                          type: YgChartSeriesType.line,
                        ),
                      ],
                    ),
                    YgChartContainerTimeline(
                      subtitle: 'Mode',
                      series: _thermostatMode,
                    ),
                    YgChartContainerTimeline(
                      subtitle: 'State',
                      series: _thermostatState,
                    ),
                  ],
                ),
              ],
            ),
            YgSection.column(
              title: 'Timelines only',
              children: <Widget>[
                YgChartContainer(
                  start: 0.0,
                  end: 24.0,
                  axisLabels: _dayLabels,
                  entries: <YgChartContainerEntry>[
                    YgChartContainerTimeline(
                      subtitle: 'State',
                      series: _thermostatState,
                    ),
                    YgChartContainerTimeline(
                      subtitle: 'Mode',
                      series: _thermostatMode,
                    ),
                    YgChartContainerTimeline(
                      subtitle: 'Energy consumption',
                      series: _consumption,
                      valueBuilder: _formatEnergy,
                    ),
                  ],
                ),
              ],
            ),
            YgSection(
              title: 'Single timeline, thicker bar without legend',
              child: YgChartContainer(
                start: 0.0,
                end: 24.0,
                axisLabels: _dayLabels,
                entries: <YgChartContainerEntry>[
                  YgChartContainerTimeline(
                    subtitle: 'Mode',
                    series: _thermostatMode,
                    size: YgStateTimelineSize.medium,
                    showLegend: false,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Fake accumulated consumption at [position], the demo counterpart of an
  /// app resolving the value from its own measurements.
  static String _formatEnergy(double position) {
    return '${(position * 0.5).toStringAsFixed(1)} kWh';
  }
}
