import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yggdrasil/src/components/buttons/yg_stepper_button/_yg_stepper_button.dart';
import 'package:yggdrasil/src/tokens/consumer_light/_consumer_light.dart' as consumer_light;
import 'package:yggdrasil/src/utils/_utils.dart';
import 'package:yggdrasil/yggdrasil.dart';

void main() {
  Future<void> pumpStepper(
    WidgetTester tester,
    YgStepper stepper,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: YgThemeDataHelper.getThemeData(YgTheme.consumerLight),
        home: Scaffold(
          body: Center(child: stepper),
        ),
      ),
    );
    await tester.pumpAndSettle();
  }

  Finder minusButton() => find.byType(YgStepperButton).first;
  Finder plusButton() => find.byType(YgStepperButton).last;

  PhysicalShape shapeOf(WidgetTester tester, Finder button) {
    return tester.widget<PhysicalShape>(
      find.descendant(
        of: button,
        matching: find.byType(PhysicalShape),
      ),
    );
  }

  LinearGradient borderGradientOf(WidgetTester tester, Finder button) {
    final ShapeBorderClipper clipper = shapeOf(tester, button).clipper as ShapeBorderClipper;
    final YgRoundedRectangleGradientBorder border = clipper.shape as YgRoundedRectangleGradientBorder;

    return border.gradient as LinearGradient;
  }

  group('YgStepper', () {
    testWidgets('increases and decreases the value by the step size', (WidgetTester tester) async {
      final List<double> changes = <double>[];

      await pumpStepper(
        tester,
        YgStepper(
          value: 5.0,
          min: 0.0,
          max: 10.0,
          onChanged: changes.add,
        ),
      );

      await tester.tap(plusButton());
      await tester.tap(minusButton());

      expect(changes, <double>[6.0, 4.0]);
    });

    testWidgets('clamps the value between min and max', (WidgetTester tester) async {
      final List<double> changes = <double>[];

      await pumpStepper(
        tester,
        YgStepper(
          value: 9.0,
          min: 0.0,
          max: 10.0,
          stepSize: 3.0,
          onChanged: changes.add,
        ),
      );

      await tester.tap(plusButton());

      expect(changes, <double>[10.0]);
    });

    testWidgets('sizes the stepper and its buttons per YgStepperSize', (WidgetTester tester) async {
      const Map<YgStepperSize, (double, double)> expectedSizes = <YgStepperSize, (double, double)>{
        YgStepperSize.small: (52.0, consumer_light.FhDimensions.xs),
        YgStepperSize.medium: (64.0, consumer_light.FhDimensions.sm),
        YgStepperSize.large: (80.0, consumer_light.FhDimensions.md),
      };

      for (final MapEntry<YgStepperSize, (double, double)> entry in expectedSizes.entries) {
        final (double height, double buttonPadding) = entry.value;
        final double buttonSize = consumer_light.FhDimensions.sm + buttonPadding * 2;

        await pumpStepper(
          tester,
          YgStepper(
            value: 5.0,
            min: 0.0,
            max: 10.0,
            size: entry.key,
            onChanged: (_) {},
          ),
        );

        expect(
          tester.getSize(find.byType(YgStepper)).height,
          height,
          reason: 'stepper height for ${entry.key}',
        );
        expect(
          tester.getSize(plusButton()),
          Size.square(buttonSize),
          reason: 'button size for ${entry.key}',
        );
      }
    });

    testWidgets('outlined variant renders transparent buttons with a gradient border', (WidgetTester tester) async {
      await pumpStepper(
        tester,
        YgStepper(
          value: 5.0,
          min: 0.0,
          max: 10.0,
          onChanged: (_) {},
        ),
      );

      expect(shapeOf(tester, plusButton()).color, Colors.transparent);
      expect(
        borderGradientOf(tester, plusButton()),
        consumer_light.FhGradients.actionPrimaryDefault,
      );
    });

    testWidgets('filled variant renders filled buttons', (WidgetTester tester) async {
      await pumpStepper(
        tester,
        YgStepper(
          value: 5.0,
          min: 0.0,
          max: 10.0,
          variant: YgStepperVariant.filled,
          onChanged: (_) {},
        ),
      );

      expect(
        shapeOf(tester, plusButton()).color,
        consumer_light.FhColors.backgroundInverse,
      );
    });

    testWidgets('colorForPlus and colorForMinus tint the outlined buttons', (WidgetTester tester) async {
      const Color plusColor = Color(0xff00ff00);
      const Color minusColor = Color(0xffff0000);

      await pumpStepper(
        tester,
        YgStepper(
          value: 5.0,
          min: 0.0,
          max: 10.0,
          colorForPlus: plusColor,
          colorForMinus: minusColor,
          onChanged: (_) {},
        ),
      );

      expect(
        borderGradientOf(tester, plusButton()).colors,
        const <Color>[plusColor, plusColor],
      );
      expect(
        borderGradientOf(tester, minusButton()).colors,
        const <Color>[minusColor, minusColor],
      );

      final BuildContext plusIconContext = tester.element(
        find
            .descendant(
              of: plusButton(),
              matching: find.bySubtype<YgIcon>(),
            )
            .first,
      );
      expect(IconTheme.of(plusIconContext).color, plusColor);
    });

    testWidgets('colorForPlus and colorForMinus fill the filled buttons', (WidgetTester tester) async {
      const Color plusColor = Color(0xff00ff00);
      const Color minusColor = Color(0xffff0000);

      await pumpStepper(
        tester,
        YgStepper(
          value: 5.0,
          min: 0.0,
          max: 10.0,
          variant: YgStepperVariant.filled,
          colorForPlus: plusColor,
          colorForMinus: minusColor,
          onChanged: (_) {},
        ),
      );

      expect(shapeOf(tester, plusButton()).color, plusColor);
      expect(shapeOf(tester, minusButton()).color, minusColor);
    });

    testWidgets('color overrides are ignored on disabled buttons', (WidgetTester tester) async {
      const Color plusColor = Color(0xff00ff00);

      await pumpStepper(
        tester,
        YgStepper(
          value: 10.0,
          min: 0.0,
          max: 10.0,
          colorForPlus: plusColor,
          onChanged: (_) {},
        ),
      );

      expect(
        borderGradientOf(tester, plusButton()).colors,
        isNot(const <Color>[plusColor, plusColor]),
      );
    });
  });
}
