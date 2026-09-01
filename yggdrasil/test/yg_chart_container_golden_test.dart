import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yggdrasil/yggdrasil.dart';

import 'extensions/_extensions.dart';
import 'utils/_utils.dart';

void main() {
  group(
    'YgChartContainerGoldenTest',
    () {
      const List<String> dayLabels = <String>['00:00', '06:00', '12:00', '18:00', '24:00'];

      const List<String> hourLabels = <String>[
        '00', '01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', //
        '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23',
      ];

      // Power drawn per hour, peaking with the morning and evening heating.
      const List<double> powerValues = <double>[
        0.4, 0.3, 0.3, 0.3, 0.4, 0.6, 2.8, 3.4, 2.1, 1.2, 0.8, 0.9, //
        2.5, 1.4, 0.9, 0.8, 1.1, 2.2, 3.0, 3.6, 2.4, 1.3, 0.7, 0.5,
      ];

      const List<YgStateTimelineSeries> modeSeries = <YgStateTimelineSeries>[
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

      const List<YgStateTimelineSeries> stateSeries = <YgStateTimelineSeries>[
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

      final GoldenTestGroup ygChartContainerGoldenTestGroup = GoldenTestGroup(
        scenarioConstraints: YgGoldenTestValues.scenarioConstraints,
        children: <GoldenTestScenario>[
          GoldenTestScenario(
            name: 'With a chart and timelines',
            child: const YgChartContainer(
              entries: <YgChartContainerEntry>[
                YgChartContainerChart(
                  subtitle: 'Power',
                  xLabels: hourLabels,
                  series: <YgChartSeries>[
                    YgChartSeries(
                      id: 'power',
                      label: 'Power',
                      values: powerValues,
                      unit: 'kW',
                      type: YgChartSeriesType.line,
                    ),
                  ],
                ),
                YgChartContainerTimeline(subtitle: 'Mode', series: modeSeries),
                YgChartContainerTimeline(subtitle: 'State', series: stateSeries),
              ],
              start: 0.0,
              end: 24.0,
              axisLabels: dayLabels,
            ),
          ),
          GoldenTestScenario(
            name: 'With timelines only',
            child: const YgChartContainer(
              entries: <YgChartContainerEntry>[
                YgChartContainerTimeline(subtitle: 'State', series: stateSeries),
                YgChartContainerTimeline(subtitle: 'Mode', series: modeSeries),
              ],
              start: 0.0,
              end: 24.0,
              axisLabels: dayLabels,
            ),
          ),
          GoldenTestScenario(
            name: 'With a single thicker timeline without legend',
            child: const YgChartContainer(
              entries: <YgChartContainerEntry>[
                YgChartContainerTimeline(
                  subtitle: 'Mode',
                  series: modeSeries,
                  size: YgStateTimelineSize.medium,
                  showLegend: false,
                ),
              ],
              start: 0.0,
              end: 24.0,
              axisLabels: dayLabels,
            ),
          ),
        ],
      );

      for (final YgThemeTestData themeTestData in YgGoldenTestValues.themesToTest) {
        goldenTest(
          'YgChartContainer - ${themeTestData.themeName}',
          fileName: 'yg_chart_container_${themeTestData.fileName}',
          builder: () => ygChartContainerGoldenTestGroup,
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
