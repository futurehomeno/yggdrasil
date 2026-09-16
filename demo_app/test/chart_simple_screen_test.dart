import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/screens/_screens.dart';

void main() {
  setUpAll(() {
    if (!sl.isRegistered<YgRouter>()) {
      sl.registerSingleton(const YgRouter());
    }
  });

  testWidgets('chart simple demo screen renders all sections', (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider<YgAppState>(
        create: (BuildContext context) => YgAppState(),
        child: MaterialApp(
          theme: YgThemeDataHelper.getThemeData(YgTheme.consumerLight),
          home: const ChartSimpleScreen(),
        ),
      ),
    );
    await tester.pumpAndSettle();

    // The six example sections plus one chart per size in the sizes section.
    expect(find.byType(YgChartSimple, skipOffstage: false), findsNWidgets(6 + YgChartSize.values.length));
    expect(find.text('Last 12 h', skipOffstage: false), findsNWidgets(5));

    // The sizes section renders every size with its name as the label.
    for (final YgChartSize size in YgChartSize.values) {
      expect(find.text(size.name, skipOffstage: false), findsOneWidget);
    }

    expect(tester.takeException(), isNull);
  });
}
