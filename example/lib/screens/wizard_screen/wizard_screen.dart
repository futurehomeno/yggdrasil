// ignore_for_file: prefer-single-widget-per-file

import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class WizardScreen extends StatefulWidget {
  const WizardScreen({super.key});

  static const String routeName = 'WizardScreen';

  static PageRouteBuilder<Widget> route() {
    return const YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const WizardScreen(),
    );
  }

  @override
  State<WizardScreen> createState() => _WizardScreenState();
}

class _WizardScreenState extends State<WizardScreen> {
  final YgWizardController controller = YgWizardController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DemoScreen(
      componentName: 'Wizard',
      scrollable: false,
      child: YgWizard(
        controller: controller,
        counterBuilder: (int step, int steps) => '$step of $steps',
        steps: List<YgWizardStep>.generate(
          5,
          (int index) => YgWizardStep(
            title: 'Step ${index + 1}',
            contentBuilder: (_) => YgSection.base(
              child: Container(
                decoration: BoxDecoration(
                  color: context.ygTheme.tokens.colors.backgroundDisabled,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
            buttons: YgButtonGroup.actionOrCancel(
              actionText: 'Next',
              onActionPressed: () => controller.nextStep(),
              cancelText: 'Previous',
              onCancelPressed: () => controller.previousStep(),
            ),
          ),
        ),
      ),
    );
  }
}
