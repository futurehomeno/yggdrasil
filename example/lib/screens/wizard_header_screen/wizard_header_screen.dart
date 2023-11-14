// ignore_for_file: prefer-single-widget-per-file

import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class WizardHeaderScreen extends StatefulWidget {
  const WizardHeaderScreen({super.key});

  static const String routeName = 'WizardHeaderScreen';

  static PageRouteBuilder<Widget> route() {
    return const YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const WizardHeaderScreen(),
    );
  }

  @override
  State<WizardHeaderScreen> createState() => _WizardHeaderScreenState();
}

class _WizardHeaderScreenState extends State<WizardHeaderScreen> with TickerProviderStateMixin {
  late final TabController controller = TabController(
    vsync: this,
    length: 5,
    animationDuration: const Duration(milliseconds: 500),
    initialIndex: 0,
  );

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DemoScreen(
      componentName: 'WizardHeader',
      child: Column(
        children: <Widget>[
          YgWizardHeader.fromTabController(
            controller: controller,
            title: 'A TabController controlled YgWizardHeader',
            buildCounter: (int p0, int p1) => 'Step $p0 of $p1',
          ),
          SizedBox(
            height: 100,
            child: TabBarView(
              controller: controller,
              children: List<Widget>.generate(
                controller.length,
                (int index) => StepTabPage(
                  index: index,
                  controller: controller,
                  steps: controller.length,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class StepTabPage extends StatelessWidget {
  const StepTabPage({
    super.key,
    required this.controller,
    required this.index,
    required this.steps,
  });

  final TabController controller;
  final int index;
  final int steps;

  @override
  Widget build(BuildContext context) {
    return YgSection.base(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          YgButton(
            onPressed: index < 1 ? null : () => controller.animateTo(index - 1),
            child: const Text('Previous step'),
          ),
          Text('Step ${index + 1} out of $steps'),
          YgButton(
            onPressed: index < steps - 1 ? () => controller.animateTo(index + 1) : null,
            child: const Text('Next step'),
          ),
        ],
      ),
    );
  }
}
