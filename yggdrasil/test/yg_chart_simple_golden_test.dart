import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yggdrasil/yggdrasil.dart';

import 'extensions/_extensions.dart';
import 'utils/_utils.dart';

void main() {
  group(
    'YgChartSimpleGoldenTest',
    () {
      const YgChartSeries risingTemperature = YgChartSeries(
        id: 'temperature',
        label: 'Temperature',
        values: <double>[20.6, 20.6, 20.7, 20.8, 21.0, 21.3, 21.7, 22.0, 22.2, 22.4, 22.5, 22.5],
        unit: '°C',
        type: YgChartSeriesType.line,
        color: Color(0xffe0762a),
      );

      const YgChartSeries temperatureBand = YgChartSeries(
        id: 'temperature-band',
        label: 'Temperature band',
        values: <double>[21.8, 21.9, 22.1, 22.0, 21.7, 21.5, 21.6, 21.9, 22.3, 22.6, 22.5, 22.4],
        lowerValues: <double>[21.4, 21.5, 21.6, 21.5, 21.2, 21.0, 21.2, 21.4, 21.8, 22.1, 22.0, 21.9],
        upperValues: <double>[22.2, 22.4, 22.5, 22.4, 22.2, 22.0, 22.1, 22.4, 22.8, 23.1, 23.0, 22.9],
        unit: '°C',
        type: YgChartSeriesType.band,
      );

      final GoldenTestGroup ygChartSimpleGoldenTestGroup = GoldenTestGroup(
        columns: 2,
        scenarioConstraints: YgGoldenTestValues.scenarioConstraints,
        children: <GoldenTestScenario>[
          GoldenTestScenario(
            name: 'With a label and a reference value',
            child: const YgChartSimple(
              label: Text('Last 12 h'),
              referenceValue: 21.0,
              series: <YgChartSeries>[risingTemperature],
            ),
          ),
          GoldenTestScenario(
            name: 'With a tight range and no snapping',
            child: const YgChartSimple(
              label: Text('Last 12 h'),
              referenceValue: 21.0,
              rangeSnap: null,
              series: <YgChartSeries>[risingTemperature],
            ),
          ),
          GoldenTestScenario(
            name: 'With a band series and a tag label',
            child: const YgChartSimple(
              label: YgTag(
                variant: YgTagVariant.warning,
                child: Text('Last 12 h'),
              ),
              series: <YgChartSeries>[temperatureBand],
            ),
          ),
          GoldenTestScenario(
            name: 'With automatic colors',
            child: const YgChartSimple(
              series: <YgChartSeries>[
                YgChartSeries(
                  id: 'living-room',
                  label: 'Living room',
                  values: <double>[21.8, 21.9, 22.1, 22.0, 21.7, 21.5, 21.6, 21.9, 22.3, 22.6, 22.5, 22.4],
                  unit: '°C',
                  type: YgChartSeriesType.line,
                ),
                YgChartSeries(
                  id: 'bedroom',
                  label: 'Bedroom',
                  values: <double>[20.6, 20.6, 20.7, 20.8, 21.0, 21.3, 21.7, 22.0, 22.2, 22.4, 22.5, 22.5],
                  unit: '°C',
                  type: YgChartSeriesType.line,
                ),
              ],
            ),
          ),
          GoldenTestScenario(
            name: 'With NaN gap values',
            child: const YgChartSimple(
              label: Text('Last 12 h'),
              series: <YgChartSeries>[
                YgChartSeries(
                  id: 'line',
                  label: 'Line',
                  values: <double>[
                    20.6,
                    20.8,
                    double.nan,
                    double.nan,
                    21.4,
                    21.7,
                    21.9,
                    double.nan,
                    22.1,
                    22.3,
                    22.4,
                    22.5,
                  ],
                  unit: '°C',
                  type: YgChartSeriesType.line,
                ),
                YgChartSeries(
                  id: 'band',
                  label: 'Band',
                  values: <double>[23.0, 23.2, 23.4, double.nan, 23.6, 23.4, 23.2, 23.0, 22.8, double.nan, 22.6, 22.4],
                  lowerValues: <double>[
                    22.8,
                    23.0,
                    23.2,
                    double.nan,
                    23.4,
                    23.2,
                    23.0,
                    22.8,
                    22.6,
                    double.nan,
                    22.4,
                    22.2,
                  ],
                  upperValues: <double>[
                    23.2,
                    23.4,
                    23.6,
                    double.nan,
                    23.8,
                    23.6,
                    23.4,
                    23.2,
                    23.0,
                    double.nan,
                    22.8,
                    22.6,
                  ],
                  unit: '°C',
                  type: YgChartSeriesType.band,
                ),
              ],
            ),
          ),
          GoldenTestScenario(
            name: 'With flat data',
            child: const YgChartSimple(
              label: Text('Last 12 h'),
              series: <YgChartSeries>[
                YgChartSeries(
                  id: 'flat',
                  label: 'Flat',
                  values: <double>[21.0, 21.0, 21.0, 21.0, 21.0, 21.0],
                  unit: '°C',
                  type: YgChartSeriesType.line,
                ),
              ],
            ),
          ),
          GoldenTestScenario(
            name: 'With xxsmall size',
            child: const YgChartSimple(
              size: YgChartSize.xxsmall,
              series: <YgChartSeries>[risingTemperature],
            ),
          ),
          GoldenTestScenario(
            name: 'With a single value',
            child: const YgChartSimple(
              label: Text('Last 12 h'),
              series: <YgChartSeries>[
                YgChartSeries(
                  id: 'single',
                  label: 'Single',
                  values: <double>[21.0],
                  unit: '°C',
                  type: YgChartSeriesType.line,
                ),
              ],
            ),
          ),
          GoldenTestScenario(
            name: 'With only a reference value',
            child: const YgChartSimple(
              label: Text('Last 12 h'),
              referenceValue: 21.0,
              series: <YgChartSeries>[],
            ),
          ),
        ],
      );

      for (final YgThemeTestData themeTestData in YgGoldenTestValues.themesToTest) {
        goldenTest(
          'YgChartSimple - ${themeTestData.themeName}',
          fileName: 'yg_chart_simple_${themeTestData.fileName}',
          builder: () => ygChartSimpleGoldenTestGroup,
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
