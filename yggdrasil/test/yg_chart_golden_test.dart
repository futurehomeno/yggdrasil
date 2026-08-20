import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yggdrasil/yggdrasil.dart';

import 'extensions/_extensions.dart';
import 'utils/_utils.dart';

void main() {
  group(
    'YgChartGoldenTest',
    () {
      const List<String> weekLabels = <String>['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

      const YgChartSeries heating = YgChartSeries(
        id: 'heating',
        label: 'Heating',
        values: <double>[4.0, 6.0, 5.0, 8.0, 7.0, 3.0, 2.0],
        unit: 'kWh',
      );

      const YgChartSeries appliances = YgChartSeries(
        id: 'appliances',
        label: 'Appliances',
        values: <double>[2.0, 1.5, 2.5, 3.0, 2.0, 4.0, 3.5],
        unit: 'kWh',
      );

      const YgChartSeries production = YgChartSeries(
        id: 'production',
        label: 'Production',
        values: <double>[-1.0, -2.0, -0.5, -3.0, -1.5, -4.0, -2.5],
        unit: 'kWh',
      );

      const YgChartSeries price = YgChartSeries(
        id: 'price',
        label: 'Price',
        values: <double>[0.8, 1.2, 2.4, 1.6, 0.9, 0.5, 0.7],
        unit: 'kr',
        type: YgChartSeriesType.line,
        axis: YgChartAxis.right,
      );

      const YgChartSeries roomTemperature = YgChartSeries(
        id: 'room-temperature',
        label: 'Room temperature',
        values: <double>[23.4, 23.9, 23.6, 23.8, 23.0, 22.3, 22.5],
        lowerValues: <double>[23.0, 23.3, 23.1, 23.2, 22.4, 22.0, 22.2],
        upperValues: <double>[23.9, 24.4, 24.0, 24.3, 23.5, 22.8, 22.9],
        unit: '°C',
        type: YgChartSeriesType.band,
      );

      final GoldenTestGroup ygChartGoldenTestGroup = GoldenTestGroup(
        columns: 2,
        scenarioConstraints: YgGoldenTestValues.scenarioConstraints,
        children: <GoldenTestScenario>[
          GoldenTestScenario(
            name: 'With a single bar series',
            child: const YgChart(
              series: <YgChartSeries>[heating],
              xLabels: weekLabels,
            ),
          ),
          GoldenTestScenario(
            name: 'With stacked bars and a line',
            child: const YgChart(
              series: <YgChartSeries>[heating, appliances, price],
              xLabels: weekLabels,
            ),
          ),
          GoldenTestScenario(
            name: 'With negative values',
            child: const YgChart(
              series: <YgChartSeries>[heating, production],
              xLabels: weekLabels,
            ),
          ),
          GoldenTestScenario(
            name: 'With two axes',
            child: const YgChart(
              series: <YgChartSeries>[heating, price],
              xLabels: weekLabels,
            ),
          ),
          GoldenTestScenario(
            name: 'With explicit colors',
            child: YgChart(
              series: <YgChartSeries>[
                heating.copyWith(color: const Color(0xff02a8f1)),
                price.copyWith(color: const Color(0xfff9470b)),
              ],
              xLabels: weekLabels,
            ),
          ),
          GoldenTestScenario(
            name: 'With a band series',
            child: const YgChart(
              series: <YgChartSeries>[roomTemperature],
              xLabels: weekLabels,
            ),
          ),
          GoldenTestScenario(
            name: 'With small size and no legend',
            child: const YgChart(
              series: <YgChartSeries>[heating, appliances],
              xLabels: weekLabels,
              size: YgChartSize.small,
              showLegend: false,
            ),
          ),
          GoldenTestScenario(
            name: 'With large size',
            child: const YgChart(
              series: <YgChartSeries>[heating, appliances],
              xLabels: weekLabels,
              size: YgChartSize.large,
            ),
          ),
          GoldenTestScenario(
            name: 'With a stepped area series',
            child: const YgChart(
              series: <YgChartSeries>[
                YgChartSeries(
                  id: 'power',
                  label: 'Power',
                  values: <double>[0.4, 5.2, 5.6, 1.2, 3.1, 0.4, 6.0],
                  unit: 'kW',
                  type: YgChartSeriesType.steppedArea,
                ),
              ],
              xLabels: weekLabels,
            ),
          ),
          GoldenTestScenario(
            name: 'With event markers',
            child: const YgChart(
              series: <YgChartSeries>[
                YgChartSeries(
                  id: 'power',
                  label: 'Power',
                  values: <double>[0.4, 5.2, 5.6, 1.2, 3.1, 0.4, 6.0],
                  unit: 'kW',
                  type: YgChartSeriesType.steppedArea,
                ),
              ],
              xLabels: weekLabels,
              size: YgChartSize.small,
              selectedEventMarkerIndex: 1,
              eventMarkers: <YgChartEventMarker>[
                YgChartEventMarker(
                  index: 1,
                  color: Color(0xffd23d2c),
                  icon: YgIcons.alert,
                  label: 'Device error',
                ),
                YgChartEventMarker(
                  index: 4,
                  color: Color(0xff5d7a8a),
                  count: 3,
                ),
              ],
            ),
          ),
          GoldenTestScenario(
            name: 'With an event density rail',
            child: YgChart(
              series: const <YgChartSeries>[
                YgChartSeries(
                  id: 'power',
                  label: 'Power',
                  values: <double>[0.4, 5.2, 5.6, 1.2, 3.1, 0.4, 6.0],
                  unit: 'kW',
                  type: YgChartSeriesType.steppedArea,
                ),
              ],
              xLabels: weekLabels,
              size: YgChartSize.small,
              selectedRailBand: 1,
              railEvents: <YgChartRailEvent>[
                // Deterministic pseudo-random cluster in the first five
                // columns, every fifth event with an own color.
                for (int i = 0; i < 40; i++)
                  YgChartRailEvent(
                    position: (i * i * 7) % 47 / 47.0 * 5.0,
                    color: i % 5 == 0 ? const Color(0xffd23d2c) : null,
                  ),
              ],
            ),
          ),
          GoldenTestScenario(
            name: 'With NaN gap values',
            child: const YgChart(
              series: <YgChartSeries>[
                YgChartSeries(
                  id: 'line',
                  label: 'Line',
                  values: <double>[1.0, 2.0, double.nan, 2.5, double.nan, 1.5, 2.0],
                  unit: 'kWh',
                  type: YgChartSeriesType.line,
                ),
                YgChartSeries(
                  id: 'band',
                  label: 'Band',
                  values: <double>[3.0, 3.2, 3.4, double.nan, 3.6, 3.4, 3.2],
                  lowerValues: <double>[2.8, 3.0, 3.2, double.nan, 3.4, 3.2, 3.0],
                  upperValues: <double>[3.2, 3.4, 3.6, double.nan, 3.8, 3.6, 3.4],
                  unit: 'kWh',
                  type: YgChartSeriesType.band,
                ),
              ],
              xLabels: weekLabels,
              size: YgChartSize.small,
            ),
          ),
          GoldenTestScenario(
            name: 'With only right axis series',
            child: const YgChart(
              series: <YgChartSeries>[price],
              xLabels: weekLabels,
              size: YgChartSize.small,
            ),
          ),
          GoldenTestScenario(
            name: 'With xxsmall size and no legend',
            child: const YgChart(
              series: <YgChartSeries>[
                YgChartSeries(
                  id: 'power',
                  label: 'Power',
                  values: <double>[0.4, 5.2, 5.6, 1.2, 3.1, 0.4, 6.0],
                  unit: 'kW',
                  type: YgChartSeriesType.steppedArea,
                ),
              ],
              xLabels: weekLabels,
              size: YgChartSize.xxsmall,
              showLegend: false,
            ),
          ),
          GoldenTestScenario(
            name: 'With xsmall size and an overflowing legend',
            child: YgChart(
              size: YgChartSize.xsmall,
              xLabels: weekLabels,
              series: <YgChartSeries>[
                for (final (int index, String room) in const <String>[
                  'Living room',
                  'Kitchen',
                  'Bedroom',
                  'Bathroom',
                  'Home office',
                ].indexed)
                  YgChartSeries(
                    id: 'room-$index',
                    label: room,
                    values: List<double>.generate(7, (int day) => 1.0 + (day + index) % 4),
                    unit: 'kWh',
                  ),
              ],
            ),
          ),
        ],
      );

      for (final YgThemeTestData themeTestData in YgGoldenTestValues.themesToTest) {
        goldenTest(
          'YgChart - ${themeTestData.themeName}',
          fileName: 'yg_chart_${themeTestData.fileName}',
          builder: () => ygChartGoldenTestGroup,
          pumpWidget: (WidgetTester widgetTester, Widget widget) {
            return widgetTester.pumpWidgetWithYgTheme(
              widget: widget,
              ygTheme: themeTestData.theme,
            );
          },
        );
      }
    },
  );
}
