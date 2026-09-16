import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class ChartSimpleScreen extends StatelessWidget {
  const ChartSimpleScreen({super.key});

  static const String routeName = 'ChartSimpleScreen';

  static PageRouteBuilder<Widget> route() {
    return const YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const ChartSimpleScreen(),
    );
  }

  /// A temperature trend rising through the setpoint, like a heating cycle.
  static const List<double> _trendValues = <double>[
    20.6, 20.6, 20.7, 20.7, 20.8, 21.0, 21.3, 21.7, 22.0, 22.2, 22.4, 22.5, //
  ];

  static const List<double> _bandAverages = <double>[
    21.8, 21.9, 22.1, 22.0, 21.7, 21.5, 21.6, 21.9, 22.3, 22.6, 22.5, 22.4, //
  ];
  static const List<double> _bandMinimums = <double>[
    21.4, 21.5, 21.6, 21.5, 21.2, 21.0, 21.2, 21.4, 21.8, 22.1, 22.0, 21.9, //
  ];
  static const List<double> _bandMaximums = <double>[
    22.2, 22.4, 22.5, 22.4, 22.2, 22.0, 22.1, 22.4, 22.8, 23.1, 23.0, 22.9, //
  ];

  @override
  Widget build(BuildContext context) {
    return DemoScreen(
      componentName: 'ChartSimple',
      child: YgLayoutBody(
        child: Column(
          children: <Widget>[
            const YgSection(
              title: 'Trend with a label and a reference value',
              child: YgChartSimple(
                label: Text('Last 12 h'),
                referenceValue: 21.0,
                series: <YgChartSeries>[
                  YgChartSeries(
                    id: 'temperature',
                    label: 'Temperature',
                    values: _trendValues,
                    unit: '°C',
                    type: YgChartSeriesType.line,
                    color: Color(0xffe0762a),
                  ),
                ],
              ),
            ),
            const YgSection(
              title: 'Temperature band with a YgTag label',
              child: YgChartSimple(
                label: YgTag(
                  variant: YgTagVariant.warning,
                  child: Text('Last 12 h'),
                ),
                series: <YgChartSeries>[
                  YgChartSeries(
                    id: 'living-room',
                    label: 'Living room',
                    values: _bandAverages,
                    lowerValues: _bandMinimums,
                    upperValues: _bandMaximums,
                    unit: '°C',
                    type: YgChartSeriesType.band,
                  ),
                ],
              ),
            ),
            const YgSection(
              title: 'Multiple lines with automatic colors',
              child: YgChartSimple(
                series: <YgChartSeries>[
                  YgChartSeries(
                    id: 'living-room',
                    label: 'Living room',
                    values: _bandAverages,
                    unit: '°C',
                    type: YgChartSeriesType.line,
                  ),
                  YgChartSeries(
                    id: 'bedroom',
                    label: 'Bedroom',
                    values: _trendValues,
                    unit: '°C',
                    type: YgChartSeriesType.line,
                  ),
                ],
              ),
            ),
            const YgSection(
              title: 'Same data hugging the scale (rangeSnap: null)',
              child: YgChartSimple(
                label: Text('Last 12 h'),
                referenceValue: 21.0,
                rangeSnap: null,
                series: <YgChartSeries>[
                  YgChartSeries(
                    id: 'temperature',
                    label: 'Temperature',
                    values: _trendValues,
                    unit: '°C',
                    type: YgChartSeriesType.line,
                    color: Color(0xffe0762a),
                  ),
                ],
              ),
            ),
            const YgSection(
              title: 'Gaps in the data (NaN values)',
              child: YgChartSimple(
                label: Text('Last 12 h'),
                series: <YgChartSeries>[
                  YgChartSeries(
                    id: 'temperature',
                    label: 'Temperature',
                    values: <double>[
                      20.6, 20.8, double.nan, double.nan, 21.4, 21.7, //
                      21.9, double.nan, 22.1, 22.3, 22.4, 22.5,
                    ],
                    unit: '°C',
                    type: YgChartSeriesType.line,
                  ),
                ],
              ),
            ),
            const YgSection(
              title: 'Flat data',
              child: YgChartSimple(
                label: Text('Last 12 h'),
                size: YgChartSize.xxsmall,
                series: <YgChartSeries>[
                  YgChartSeries(
                    id: 'temperature',
                    label: 'Temperature',
                    values: <double>[21.0, 21.0, 21.0, 21.0, 21.0, 21.0],
                    unit: '°C',
                    type: YgChartSeriesType.line,
                  ),
                ],
              ),
            ),
            YgSection.column(
              title: 'Sizes',
              children: <Widget>[
                for (final YgChartSize size in YgChartSize.values) ...<Widget>[
                  YgChartSimple(
                    label: Text(size.name),
                    size: size,
                    series: const <YgChartSeries>[
                      YgChartSeries(
                        id: 'temperature',
                        label: 'Temperature',
                        values: _trendValues,
                        unit: '°C',
                        type: YgChartSeriesType.line,
                      ),
                    ],
                  ),
                  const YgDivider(),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}
