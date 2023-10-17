import 'package:alchemist/alchemist.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:yggdrasil/yggdrasil.dart';

void main() {
  group(
    'YgCalloutAlchemistTest',
    () {
      goldenTest(
        'YgCallout',
        fileName: 'yg_callout_alchemist',
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
        // pumpWidget: (WidgetTester tester, Widget widget) {
        //   return YgPumpDeviceBuilder.alchemistPumpDeviceBuilder(
        //     widgetTester: tester,
        //     widget: widget,
        //   );
        // },
      );
    },
  );
}
