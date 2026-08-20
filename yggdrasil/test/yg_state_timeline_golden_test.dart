import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yggdrasil/yggdrasil.dart';

import 'extensions/_extensions.dart';
import 'utils/_utils.dart';

void main() {
  group(
    'YgStateTimelineGoldenTest',
    () {
      const List<String> dayLabels = <String>['00:00', '06:00', '12:00', '18:00', '24:00'];

      // A full day of thermostat states without gaps.
      const List<YgStateTimelineSeries> hvacDay = <YgStateTimelineSeries>[
        YgStateTimelineSeries(
          id: 'heat',
          label: 'Heat',
          ranges: <YgStateTimelineRange>[
            YgStateTimelineRange(start: 0.0, end: 6.0),
            YgStateTimelineRange(start: 13.0, end: 18.0),
          ],
        ),
        YgStateTimelineSeries(
          id: 'cool',
          label: 'Cool',
          ranges: <YgStateTimelineRange>[
            YgStateTimelineRange(start: 8.0, end: 11.5),
          ],
        ),
        YgStateTimelineSeries(
          id: 'fan',
          label: 'Fan',
          ranges: <YgStateTimelineRange>[
            YgStateTimelineRange(start: 11.5, end: 13.0),
            YgStateTimelineRange(start: 22.0, end: 24.0),
          ],
        ),
        YgStateTimelineSeries(
          id: 'idle',
          label: 'Idle',
          ranges: <YgStateTimelineRange>[
            YgStateTimelineRange(start: 6.0, end: 8.0),
            YgStateTimelineRange(start: 18.0, end: 22.0),
          ],
        ),
      ];

      // Sparse activity, most of the track shows through.
      const List<YgStateTimelineSeries> sparseDay = <YgStateTimelineSeries>[
        YgStateTimelineSeries(
          id: 'boost',
          label: 'Boost',
          ranges: <YgStateTimelineRange>[
            YgStateTimelineRange(start: 7.0, end: 9.0),
            YgStateTimelineRange(start: 19.0, end: 20.0),
          ],
        ),
        YgStateTimelineSeries(
          id: 'eco',
          label: 'Eco',
          ranges: <YgStateTimelineRange>[
            YgStateTimelineRange(start: 12.0, end: 14.0),
          ],
        ),
      ];

      final GoldenTestGroup ygStateTimelineGoldenTestGroup = GoldenTestGroup(
        scenarioConstraints: YgGoldenTestValues.scenarioConstraints,
        children: <GoldenTestScenario>[
          GoldenTestScenario(
            name: 'With a full day of states',
            child: const YgStateTimeline(
              series: hvacDay,
              start: 0.0,
              end: 24.0,
              axisLabels: dayLabels,
            ),
          ),
          GoldenTestScenario(
            name: 'With gaps showing the track',
            child: const YgStateTimeline(
              series: sparseDay,
              start: 0.0,
              end: 24.0,
              axisLabels: dayLabels,
            ),
          ),
          GoldenTestScenario(
            name: 'With a thicker bar and explicit colors',
            child: const YgStateTimeline(
              series: <YgStateTimelineSeries>[
                YgStateTimelineSeries(
                  id: 'on',
                  label: 'On',
                  color: Color(0xff02a8f1),
                  ranges: <YgStateTimelineRange>[
                    YgStateTimelineRange(start: 2.0, end: 9.0),
                    YgStateTimelineRange(start: 15.0, end: 21.0),
                  ],
                ),
                YgStateTimelineSeries(
                  id: 'off',
                  label: 'Off',
                  color: Color(0xfff9470b),
                  ranges: <YgStateTimelineRange>[
                    YgStateTimelineRange(start: 9.0, end: 15.0),
                  ],
                ),
              ],
              start: 0.0,
              end: 24.0,
              axisLabels: dayLabels,
              size: YgStateTimelineSize.medium,
            ),
          ),
          GoldenTestScenario(
            name: 'Without axis labels and legend',
            child: const YgStateTimeline(
              series: hvacDay,
              start: 0.0,
              end: 24.0,
              showLegend: false,
            ),
          ),
        ],
      );

      for (final YgThemeTestData themeTestData in YgGoldenTestValues.themesToTest) {
        goldenTest(
          'YgStateTimeline - ${themeTestData.themeName}',
          fileName: 'yg_state_timeline_${themeTestData.fileName}',
          builder: () => ygStateTimelineGoldenTestGroup,
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
