import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:yggdrasil/yggdrasil.dart';

class _YgCalloutGoldenTest {
  const _YgCalloutGoldenTest();

  void main() {
    group('YgCalloutGoldenTest', () {
      testGoldens(
        'YgCallout',
        (WidgetTester tester) async {
          final DeviceBuilder builder = DeviceBuilder()
            ..addScenario(
              widget: const Scaffold(
                body: YgCallout(
                  description: 'Lorem ipsum',
                ),
              ),
            );

          await tester.pumpDeviceBuilder(
            builder,
            wrapper: materialAppWrapper(
              theme: YgThemeDataHelper.getThemeData(YgTheme.consumerLight),
            ),
          );

          await screenMatchesGolden(tester, 'yg_callout');
        },
      );
    });
  }
}
