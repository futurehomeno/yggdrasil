import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:yggdrasil/yggdrasil.dart';

import 'utils/_utils.dart';

void main() {
  group('YgCalloutGoldenToolkitTest', () {
    testGoldens(
      'YgCallout',
      (WidgetTester tester) async {
        final DeviceBuilder builder = DeviceBuilder()
          ..addScenario(
            name: 'All parameters',
            widget: YgScenarioWidgetWrapper(
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
          )
          ..addScenario(
            name: 'Without onClose',
            widget: YgScenarioWidgetWrapper(
              child: YgCallout(
                title: 'Callout title',
                description: 'Callout description',
                textLink: YgTextLink(
                  text: 'Text link',
                  onPressed: () {},
                ),
              ),
            ),
          )
          ..addScenario(
            name: 'Title and description',
            widget: const YgScenarioWidgetWrapper(
              child: YgCallout(
                title: 'Callout title',
                description: 'Callout description',
              ),
            ),
          )
          ..addScenario(
            name: 'Description only',
            widget: const YgScenarioWidgetWrapper(
              child: YgCallout(
                description: 'Callout description',
              ),
            ),
          );

        await YgPumpDeviceBuilder.goldenToolkitPumpDeviceBuilder(
          deviceBuilder: builder,
          widgetTester: tester,
        );

        await screenMatchesGolden(tester, 'yg_callout_golden_toolkit');
      },
    );
  });
}
