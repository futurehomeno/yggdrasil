import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yggdrasil/src/components/yg_tile_selector/widgets/yg_tile_selector_spec.dart';
import 'package:yggdrasil/src/components/yg_tile_selector/widgets/yg_tile_selector_tile.dart';
import 'package:yggdrasil/src/tokens/consumer_light/_consumer_light.dart' as consumer_light;
import 'package:yggdrasil/yggdrasil.dart';

void main() {
  const List<YgSelectorTile<String>> modes = <YgSelectorTile<String>>[
    YgSelectorTile<String>(value: 'home', icon: YgIcons.house, label: 'Home'),
    YgSelectorTile<String>(value: 'away', icon: YgIcons.homeAway, label: 'Away'),
    YgSelectorTile<String>(value: 'sleep', icon: YgIcons.night, label: 'Sleep', disabled: true),
    YgSelectorTile<String>(value: 'vacation', icon: YgIcons.homeVacation, label: 'Vacation'),
  ];

  const List<YgSelectorTile<String>> manyModes = <YgSelectorTile<String>>[
    ...modes,
    YgSelectorTile<String>(value: 'heat', icon: YgIcons.flames, label: 'Heat'),
    YgSelectorTile<String>(value: 'eco', icon: YgIcons.leaf, label: 'Eco'),
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

  Finder tileFinder(String label) {
    return find.ancestor(
      of: find.text(label),
      matching: find.byType(YgTileSelectorTile),
    );
  }

  AnimatedContainer tileContainerOf(WidgetTester tester, String label) {
    return tester.widget<AnimatedContainer>(
      find.ancestor(
        of: find.text(label),
        matching: find.byType(AnimatedContainer),
      ),
    );
  }

  AnimatedContainer circleOf(WidgetTester tester, String label) {
    return tester.widget<AnimatedContainer>(
      find.descendant(
        of: tileFinder(label),
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

    expect(find.byType(YgTileSelectorTile), findsNWidgets(4));
    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Away'), findsOneWidget);
    expect(find.text('Sleep'), findsOneWidget);
    expect(find.text('Vacation'), findsOneWidget);
    expect(find.byType(SingleChildScrollView), findsNothing);
    expect(find.byKey(const ValueKey<Object?>('home')), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('asserts on tiles with duplicate values', (WidgetTester tester) async {
    await pumpSelector(
      tester,
      YgTileSelector<String>(
        tiles: const <YgSelectorTile<String>>[
          YgSelectorTile<String>(value: 'home', icon: YgIcons.house, label: 'Home'),
          YgSelectorTile<String>(value: 'home', icon: YgIcons.homeAway, label: 'Away'),
        ],
        value: 'home',
        onValueChanged: (String newValue) {},
      ),
    );

    expect(tester.takeException(), isAssertionError);
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

    final Iterable<YgTileSelectorTile> tileButtons =
        tester.widgetList<YgTileSelectorTile>(find.byType(YgTileSelectorTile));

    expect(tileButtons.length, 4);
    for (final YgTileSelectorTile tileButton in tileButtons) {
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

    expect(find.byType(YgTileSelectorTile), findsNWidgets(6));
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

  testWidgets('releases the pressed scale when a scroll claims the pointer', (WidgetTester tester) async {
    await pumpSelector(
      tester,
      SizedBox(
        width: 400.0,
        child: YgTileSelector<String>(
          tiles: manyModes,
          value: 'home',
          onValueChanged: (String newValue) {},
        ),
      ),
    );

    final TestGesture gesture = await tester.startGesture(tester.getCenter(find.text('Away')));
    await tester.pump();

    expect(scaleOf(tester, 'Away').scale, lessThan(1.0));

    await gesture.moveBy(const Offset(-100.0, 0.0));
    await tester.pump();

    expect(scaleOf(tester, 'Away').scale, 1.0);

    await gesture.up();
    await tester.pumpAndSettle();
  });

  testWidgets('releases the pressed scale when disabled mid press', (WidgetTester tester) async {
    final List<String> calls = <String>[];
    late StateSetter setOuterState;
    bool enabled = true;

    await pumpSelector(
      tester,
      StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          setOuterState = setState;
          return YgTileSelector<String>(
            tiles: modes,
            value: 'home',
            onValueChanged: enabled ? calls.add : null,
          );
        },
      ),
    );

    final TestGesture gesture = await tester.startGesture(tester.getCenter(find.text('Away')));
    await tester.pump();

    expect(scaleOf(tester, 'Away').scale, lessThan(1.0));

    setOuterState(() => enabled = false);
    await tester.pump();

    expect(scaleOf(tester, 'Away').scale, 1.0);

    await gesture.up();
    await tester.pumpAndSettle();

    expect(calls, isEmpty);
  });

  testWidgets('plays the blur pop entrance when the selection moves', (WidgetTester tester) async {
    String value = 'home';
    await pumpSelector(
      tester,
      StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return YgTileSelector<String>(
            tiles: modes,
            value: value,
            onValueChanged: (String newValue) => setState(() => value = newValue),
          );
        },
      ),
    );

    expect(find.byType(ImageFiltered), findsNothing);

    await tester.tap(find.text('Away'));
    await tester.pump();
    await tester.pump();

    expect(find.byType(ImageFiltered), findsOneWidget);

    await tester.pumpAndSettle();

    expect(find.byType(ImageFiltered), findsNothing);
  });

  testWidgets('skips the selection entrance when animations are disabled', (WidgetTester tester) async {
    String value = 'home';
    await pumpSelector(
      tester,
      Builder(
        builder: (BuildContext context) => MediaQuery(
          data: MediaQuery.of(context).copyWith(disableAnimations: true),
          child: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return YgTileSelector<String>(
                tiles: modes,
                value: value,
                onValueChanged: (String newValue) => setState(() => value = newValue),
              );
            },
          ),
        ),
      ),
    );

    await tester.tap(find.text('Away'));
    await tester.pump();
    await tester.pump();

    expect(find.byType(ImageFiltered), findsNothing);
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

    BoxDecoration tileFillOf(String label) {
      return tileContainerOf(tester, label).decoration! as BoxDecoration;
    }

    BorderSide tileBorderOf(String label) {
      final BoxDecoration decoration = tileContainerOf(tester, label).foregroundDecoration! as BoxDecoration;

      return (decoration.border! as Border).top;
    }

    expect(tileFillOf('Home').color, consumer_light.FhColors.backgroundTransparent);
    expect(tileFillOf('Away').color, consumer_light.FhColors.backgroundTransparent);
    expect(tileBorderOf('Home').color, consumer_light.FhColors.borderHighlightDefault);
    expect(tileBorderOf('Home').width, consumer_light.FhBorders.md.top.width);
    expect(tileBorderOf('Away').color, consumer_light.FhColors.borderDefault);
    expect(tileBorderOf('Away').width, consumer_light.FhBorders.sm.top.width);
    expect((circleOf(tester, 'Home').decoration! as BoxDecoration).color, consumer_light.FhColors.backgroundTransparent);
  });

  testWidgets('outlined tiles keep the same size when the selection moves', (WidgetTester tester) async {
    await pumpSelector(
      tester,
      YgTileSelector<String>(
        tiles: modes,
        value: 'home',
        variant: YgTileSelectorVariant.outlined,
        onValueChanged: (String newValue) {},
      ),
    );

    expect(
      tester.getSize(tileFinder('Home')),
      tester.getSize(tileFinder('Away')),
    );
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

    expect(selectedCircle.color, consumer_light.FhColors.backgroundHighlightDefault);
    expect(unselectedCircle.color, consumer_light.FhColors.backgroundDefault);
  });

  testWidgets('shows an overlay when hovered', (WidgetTester tester) async {
    await pumpSelector(
      tester,
      YgTileSelector<String>(
        tiles: modes,
        value: 'home',
        onValueChanged: (String newValue) {},
      ),
    );

    final InkWell inkWell = tester.widget<InkWell>(
      find.descendant(
        of: tileFinder('Home'),
        matching: find.byType(InkWell),
      ),
    );

    expect(inkWell.overlayColor!.resolve(<WidgetState>{WidgetState.hovered}), isNotNull);
    expect(inkWell.overlayColor!.resolve(<WidgetState>{}), isNull);
  });

  testWidgets('announces the selection without the icon name and disabled tiles as disabled',
      (WidgetTester tester) async {
    final SemanticsHandle handle = tester.ensureSemantics();
    await pumpSelector(
      tester,
      YgTileSelector<String>(
        tiles: modes,
        value: 'home',
        onValueChanged: (String newValue) {},
      ),
    );

    expect(
      tester.getSemantics(find.text('Home')),
      isSemantics(
        label: 'Home',
        isChecked: true,
        isInMutuallyExclusiveGroup: true,
        isEnabled: true,
        hasTapAction: true,
      ),
    );
    expect(
      tester.getSemantics(find.text('Sleep')),
      isSemantics(
        label: 'Sleep',
        isChecked: false,
        hasEnabledState: true,
        isEnabled: false,
      ),
    );

    handle.dispose();
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
