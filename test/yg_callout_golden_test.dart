import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:yggdrasil/yggdrasil.dart';

import 'utils/_utils.dart';

void main() {
  group(
    'YgCalloutGoldenTest',
    () {
      goldenTest(
        'YgCallout consumer_light',
        fileName: 'yg_callout_light',
        builder: () => GoldenTestGroup(
          children: <GoldenTestScenario>[
            GoldenTestScenario(
              name: 'All parameters',
              child: YgCallout(
                title: 'Callout title',
                description: 'Callout description',
                onClose: () {},
                textLink: YgTextLink(
                  text: 'Text link',
                  onPressed: () {},
                ),
              ),
            ),
            GoldenTestScenario(
              name: 'Without onClose',
              child: YgCallout(
                title: 'Callout title',
                description: 'Callout description',
                textLink: YgTextLink(
                  text: 'Text link',
                  onPressed: () {},
                ),
              ),
            ),
            GoldenTestScenario(
              name: 'Title and description',
              child: const YgCallout(
                title: 'Callout title',
                description: 'Callout description',
              ),
            ),
            GoldenTestScenario(
              name: 'Description only',
              child: const YgCallout(
                description: 'Callout description',
              ),
            ),
          ],
        ),
        pumpWidget: (WidgetTester tester, Widget widget) {
          return YgThemePumper.pumpWidgetWithYgTheme(
            widgetTester: tester,
            widget: widget,
            ygTheme: YgTheme.consumerLight,
          );
        },
      );

      goldenTest(
        'YgCallout consumer_dark',
        fileName: 'yg_callout_dark',
        builder: () => GoldenTestGroup(
          children: <GoldenTestScenario>[
            GoldenTestScenario(
              name: 'All parameters',
              child: YgCallout(
                title: 'Callout title',
                description: 'Callout description',
                onClose: () {},
                textLink: YgTextLink(
                  text: 'Text link',
                  onPressed: () {},
                ),
              ),
            ),
            GoldenTestScenario(
              name: 'Without onClose',
              child: YgCallout(
                title: 'Callout title',
                description: 'Callout description',
                textLink: YgTextLink(
                  text: 'Text link',
                  onPressed: () {},
                ),
              ),
            ),
            GoldenTestScenario(
              name: 'Title and description',
              child: const YgCallout(
                title: 'Callout title',
                description: 'Callout description',
              ),
            ),
            GoldenTestScenario(
              name: 'Description only',
              child: const YgCallout(
                description: 'Callout description',
              ),
            ),
          ],
        ),
        pumpWidget: (WidgetTester tester, Widget widget) {
          return YgThemePumper.pumpWidgetWithYgTheme(
            widgetTester: tester,
            widget: widget,
            ygTheme: YgTheme.consumerDark,
          );
        },
      );
    },
  );
}
