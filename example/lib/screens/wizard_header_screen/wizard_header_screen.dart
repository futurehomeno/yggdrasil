// ignore_for_file: prefer-single-widget-per-file

import 'package:flutter/material.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

import 'widgets/_widgets.dart';

class WizardHeaderScreen extends StatelessWidget {
  const WizardHeaderScreen({super.key});

  static const String routeName = 'WizardHeaderScreen';

  static PageRouteBuilder<Widget> route() {
    return const YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const WizardHeaderScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DemoScreen(
      componentName: 'WizardHeader',
      child: Column(
        children: <Widget>[
          ...List<Widget>.generate(
            5,
            (int index) => WizardHeaderExample(
              steps: index + 2,
              title: 'WizardHeader with ${index + 2} steps',
            ),
          ),
        ],
      ),
    );
  }
}
