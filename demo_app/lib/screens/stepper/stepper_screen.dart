import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class StepperScreen extends StatefulWidget {
  const StepperScreen({super.key});

  static const String routeName = 'StepperScreen';

  static PageRouteBuilder<Widget> route() {
    return const YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const StepperScreen(),
    );
  }

  @override
  State<StepperScreen> createState() => _StepperScreenState();
}

class _StepperScreenState extends State<StepperScreen> {
  double value = 0;
  double value2 = 0;
  double value3 = 0;
  double value4 = 0;
  double sizesValue = 0;
  double filledValue = 0;
  double coloredValue = 0;

  @override
  Widget build(BuildContext context) {
    return DemoScreen(
      componentName: 'Stepper',
      child: YgLayoutBody(
        child: Column(
          children: <Widget>[
            YgSection(
              title: 'Default stepper',
              child: YgStepper(
                value: value,
                onChanged: (double value) => setState(
                  () => this.value = value,
                ),
                max: 10,
              ),
            ),
            YgSection(
              title: 'Stepper with metric',
              child: YgStepper(
                value: value2,
                onChanged: (double value) => setState(
                  () => value2 = value,
                ),
                max: 10,
                metric: 'KwH',
              ),
            ),
            const YgSection(
              title: 'Disabled stepper with metric',
              child: YgStepper(
                value: 0,
                onChanged: null,
                max: 10,
                metric: 'KwH',
              ),
            ),
            YgSection.column(
              title: 'Stepper sizes',
              children: <Widget>[
                for (final YgStepperSize size in YgStepperSize.values)
                  YgStepper(
                    value: sizesValue,
                    onChanged: (double value) => setState(
                      () => sizesValue = value,
                    ),
                    max: 10,
                    size: size,
                    metric: 'KwH',
                  ),
              ],
            ),
            YgSection(
              title: 'Filled stepper',
              child: YgStepper(
                value: filledValue,
                onChanged: (double value) => setState(
                  () => filledValue = value,
                ),
                max: 10,
                variant: YgStepperVariant.filled,
                metric: 'KwH',
              ),
            ),
            const YgSection(
              title: 'Disabled filled stepper',
              child: YgStepper(
                value: 0,
                onChanged: null,
                max: 10,
                variant: YgStepperVariant.filled,
                metric: 'KwH',
              ),
            ),
            YgSection(
              title: 'Stepper with custom button colors',
              child: YgStepper(
                value: coloredValue,
                onChanged: (double value) => setState(
                  () => coloredValue = value,
                ),
                max: 10,
                colorForPlus: context.tokens.colors.iconSuccess,
                colorForMinus: context.tokens.colors.iconCritical,
              ),
            ),
            YgSection.column(
              title: 'Stepper with custom step size',
              children: <Widget>[
                YgStepper(
                  value: value3,
                  onChanged: (double value) => setState(
                    () => value3 = value,
                  ),
                  max: 1,
                  stepSize: 0.1,
                ),
                YgStepper(
                  value: value4,
                  onChanged: (double value) => setState(
                    () => value4 = value,
                  ),
                  max: 100,
                  stepSize: 10,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
