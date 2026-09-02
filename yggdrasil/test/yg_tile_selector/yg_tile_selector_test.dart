import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yggdrasil/src/components/yg_tile_selector/widgets/yg_tile_selector_spec.dart';
import 'package:yggdrasil/src/components/yg_tile_selector/widgets/yg_tile_selector_tile_button.dart';
import 'package:yggdrasil/yggdrasil.dart';

void main() {
  const List<YgTileSelectorTile<String>> modes = <YgTileSelectorTile<String>>[
    YgTileSelectorTile<String>(value: 'home', icon: YgIcons.house, label: 'Home'),
    YgTileSelectorTile<String>(value: 'away', icon: YgIcons.homeAway, label: 'Away'),
    YgTileSelectorTile<String>(value: 'sleep', icon: YgIcons.night, label: 'Sleep', disabled: true),
    YgTileSelectorTile<String>(value: 'vacation', icon: YgIcons.homeVacation, label: 'Vacation'),
  ];

  const List<YgTileSelectorTile<String>> manyModes = <YgTileSelectorTile<String>>[
    ...modes,
    YgTileSelectorTile<String>(value: 'heat', icon: YgIcons.flames, label: 'Heat'),
    YgTileSelectorTile<String>(value: 'eco', icon: YgIcons.leaf, label: 'Eco'),
  ];

  Future<void> pumpSelector(
    WidgetTester tester,
    Widget selector,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: YgThemeDataHelper.getThemeData(YgTheme.consumerLight),
        home: Scaffold(body: Center(child: selector)),
      ),
    );
    await tester.pumpAndSettle();
  }

  AnimatedScale scaleOf(WidgetTester tester, String label) {
    return tester.widget<AnimatedScale>(
      find.ancestor(
        of: find.text(label),
        matching: find.byType(AnimatedScale),
      ),
    );
  }

  AnimatedContainer circleOf(WidgetTester tester, String label) {
    return tester.widget<AnimatedContainer>(
      find.descendant(
        of: find.ancestor(
          of: find.text(label),
          matching: find.byType(YgTileSelectorTileButton),
        ),
        matching: find.byWidgetPredicate(
          (Widget widget) =>
              widget is AnimatedContainer &&
              widget.decoration is BoxDecoration &&
              (widget.decoration! as BoxDecoration).shape == BoxShape.circle,
        ),
      ),
    );
  }

  testWidgets('renders a tile per model without scrolling', (WidgetTester tester) async {
    await pumpSelector(
      tester,
      YgTileSelector<String>(
        tiles: modes,
        value: 'home',
        onValueChanged: (String newValue) {},
      ),
    );

    expect(find.byType(YgTileSelectorTileButton), findsNWidgets(4));
    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Away'), findsOneWidget);
    expect(find.text('Sleep'), findsOneWidget);
    expect(find.text('Vacation'), findsOneWidget);
    expect(find.byType(SingleChildScrollView), findsNothing);
    expect(tester.takeException(), isNull);
  });

  testWidgets('calls onValueChanged with the value of the pressed tile', (WidgetTester tester) async {
    final List<String> calls = <String>[];
    await pumpSelector(
      tester,
      YgTileSelector<String>(
        tiles: modes,
        value: 'home',
        onValueChanged: calls.add,
      ),
    );

    await tester.tap(find.text('Away'));
    await tester.pumpAndSettle();

    expect(calls, <String>['away']);
  });

  testWidgets('does not respond on a disabled tile', (WidgetTester tester) async {
    final List<String> calls = <String>[];
    await pumpSelector(
      tester,
      YgTileSelector<String>(
        tiles: modes,
        value: 'home',
        onValueChanged: calls.add,
      ),
    );

    final TestGesture gesture = await tester.startGesture(tester.getCenter(find.text('Sleep')));
    await tester.pump();

    expect(scaleOf(tester, 'Sleep').scale, 1.0);

    await gesture.up();
    await tester.pumpAndSettle();

    expect(calls, isEmpty);
  });

  testWidgets('disables every tile without onValueChanged', (WidgetTester tester) async {
    await pumpSelector(
      tester,
      const YgTileSelector<String>(
        tiles: modes,
        value: 'home',
        onValueChanged: null,
      ),
    );

    final Iterable<YgTileSelectorTileButton> tileButtons =
        tester.widgetList<YgTileSelectorTileButton>(find.byType(YgTileSelectorTileButton));

    expect(tileButtons.length, 4);
    for (final YgTileSelectorTileButton tileButton in tileButtons) {
      expect(tileButton.onPressed, isNull);
    }
  });

  testWidgets('becomes scrollable with more than 5 tiles', (WidgetTester tester) async {
    await pumpSelector(
      tester,
      YgTileSelector<String>(
        tiles: manyModes,
        value: 'home',
        onValueChanged: (String newValue) {},
      ),
    );

    expect(find.byType(YgTileSelectorTileButton), findsNWidgets(6));
    expect(find.byType(SingleChildScrollView), findsOneWidget);
  });

  testWidgets('scales down while pressed and springs back on release', (WidgetTester tester) async {
    await pumpSelector(
      tester,
      YgTileSelector<String>(
        tiles: modes,
        value: 'home',
        onValueChanged: (String newValue) {},
      ),
    );

    final TestGesture gesture = await tester.startGesture(tester.getCenter(find.text('Away')));
    await tester.pump();

    expect(scaleOf(tester, 'Away').scale, lessThan(1.0));
    expect(scaleOf(tester, 'Home').scale, 1.0);

    await gesture.up();
    await tester.pump();

    expect(scaleOf(tester, 'Away').scale, 1.0);
    await tester.pumpAndSettle();
  });

  testWidgets('skips the press animation when animations are disabled', (WidgetTester tester) async {
    await pumpSelector(
      tester,
      Builder(
        builder: (BuildContext context) => MediaQuery(
          data: MediaQuery.of(context).copyWith(disableAnimations: true),
          child: YgTileSelector<String>(
            tiles: modes,
            value: 'home',
            onValueChanged: (String newValue) {},
          ),
        ),
      ),
    );

    final TestGesture gesture = await tester.startGesture(tester.getCenter(find.text('Away')));
    await tester.pump();

    expect(scaleOf(tester, 'Away').scale, 1.0);

    await gesture.up();
    await tester.pumpAndSettle();
  });

  testWidgets('outlined variant has no fill and a hairline border', (WidgetTester tester) async {
    await pumpSelector(
      tester,
      YgTileSelector<String>(
        tiles: modes,
        value: 'home',
        variant: YgTileSelectorVariant.outlined,
        onValueChanged: (String newValue) {},
      ),
    );

    BoxDecoration tileDecorationOf(String label) {
      return tester
          .widget<AnimatedContainer>(
            find.ancestor(
              of: find.text(label),
              matching: find.byType(AnimatedContainer),
            ),
          )
          .decoration! as BoxDecoration;
    }

    final BoxDecoration selectedTile = tileDecorationOf('Home');
    final BoxDecoration unselectedTile = tileDecorationOf('Away');

    expect(selectedTile.color, const Color(0x00ffffff));
    expect(unselectedTile.color, const Color(0x00ffffff));
    expect(selectedTile.border!.top.color, const Color(0xff02a8f1));
    expect(selectedTile.border!.top.width, 2.0);
    expect(unselectedTile.border!.top.color, const Color(0xffc4cce2));
    expect(unselectedTile.border!.top.width, 1.0);
    expect((circleOf(tester, 'Home').decoration! as BoxDecoration).color, const Color(0x00ffffff));
  });

  testWidgets('carries the selection with the highlight colors', (WidgetTester tester) async {
    await pumpSelector(
      tester,
      YgTileSelector<String>(
        tiles: modes,
        value: 'home',
        onValueChanged: (String newValue) {},
      ),
    );

    final BoxDecoration selectedCircle = circleOf(tester, 'Home').decoration! as BoxDecoration;
    final BoxDecoration unselectedCircle = circleOf(tester, 'Away').decoration! as BoxDecoration;

    expect(selectedCircle.color, const Color(0xff02a8f1));
    expect(unselectedCircle.color, const Color(0xffffffff));
  });

  testWidgets('resolves bigger sizing for bigger sizes', (WidgetTester tester) async {
    late BuildContext capturedContext;
    await pumpSelector(
      tester,
      Builder(
        builder: (BuildContext context) {
          capturedContext = context;
          return const SizedBox.shrink();
        },
      ),
    );

    final YgTileSelectorSpec small = YgTileSelectorSpec.resolve(capturedContext, YgTileSelectorSize.small);
    final YgTileSelectorSpec medium = YgTileSelectorSpec.resolve(capturedContext, YgTileSelectorSize.medium);
    final YgTileSelectorSpec large = YgTileSelectorSpec.resolve(capturedContext, YgTileSelectorSize.large);

    expect(small.iconSize, lessThan(medium.iconSize));
    expect(medium.iconSize, lessThan(large.iconSize));
    expect(small.circleSize, small.iconSize * 2);
    expect(medium.scrollTileWidth, greaterThan(medium.circleSize));
    expect(small.labelStyle.fontSize, lessThan(large.labelStyle.fontSize!));
  });
}
