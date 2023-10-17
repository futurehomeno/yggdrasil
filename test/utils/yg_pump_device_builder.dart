import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:yggdrasil/src/theme/_theme.dart';

class YgPumpDeviceBuilder {
  const YgPumpDeviceBuilder._();

  static Future<void> goldenToolkitPumpDeviceBuilder({
    required WidgetTester widgetTester,
    required DeviceBuilder deviceBuilder,
  }) {
    return widgetTester.pumpDeviceBuilder(
      deviceBuilder,
      wrapper: materialAppWrapper(
        theme: YgThemeDataHelper.getThemeData(YgTheme.consumerLight),
      ),
    );
  }
}
