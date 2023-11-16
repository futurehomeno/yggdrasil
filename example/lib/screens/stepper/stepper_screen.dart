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

  @override
  Widget build(BuildContext context) {
    return DemoScreen(
      componentName: 'Stepper',
      child: Column(
        children: <Widget>[
          YgSection.base(
            title: 'Default stepper',
            child: YgStepper(
              value: value,
              onChanged: (double value) => setState(
                () => this.value = value,
              ),
              max: 10,
            ),
          ),
          YgSection.base(
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
          YgSection.column(
            title: 'Stepper with custom step size',
            children: <Widget>[
              YgStepper(
                value: value3,
                onChanged: (double value) => setState(
                  () => value3 = value,
                ),
                max: 1,
                stepSize: .1,
              ),
              YgStepper(
                value: value4,
                onChanged: (double value) => setState(
                  () => value4 = value,
                ),
                max: 100,
                stepSize: 10,
              ),
            ].withVerticalSpacing(20),
          ),
        ],
      ),
    );
  }
}
