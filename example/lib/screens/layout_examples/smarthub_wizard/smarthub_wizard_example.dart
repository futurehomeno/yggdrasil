// ignore_for_file: prefer-single-widget-per-file

import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class SmarthubWizardExample extends StatefulWidget {
  const SmarthubWizardExample({super.key});

  static const String routeName = 'SmarthubWizardExample';

  static PageRouteBuilder<Widget> route() {
    return const YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const SmarthubWizardExample(),
    );
  }

  @override
  State<SmarthubWizardExample> createState() => _SmarthubWizardExampleState();
}

class _SmarthubWizardExampleState extends State<SmarthubWizardExample> {
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
        steps: <YgWizardStep>[
          YgWizardStep(
            title: 'Set up the Smarthub',
            contentBuilder: (_) => Column(
              children: <Widget>[
                YgSection.base(
                  child: Image.asset(
                    'assets/images/smarthub_back.png',
                    semanticLabel: 'smarthub back',
                  ),
                ),
                const YgSection.base(
                  title: 'Connect the Smarthub to power and network',
                  child: Text(
                    'Connect cables to provide power and internet connection for device operation.\n\nNetwork and power plugs can be found on the bottom of the Futurehome Smarthub.',
                  ),
                ),
              ],
            ),
            buttons: YgButtonGroup.actionOrCancel(
              actionText: 'Continue next step',
              onActionPressed: () => controller.nextStep(),
              cancelText: 'Cancel onboarding',
              onCancelPressed: () => Navigator.of(context).pop(),
            ),
          ),
          YgWizardStep(
            title: 'Identify the Smarthub',
            contentBuilder: (_) => const YgSection.base(
              title: 'Pair the Smarthub use QR code or serial number',
              child: Text(
                'Grant permission to access your phone\'s camera to scan the QR code, or manually input the serial number.',
              ),
            ),
            buttons: YgButtonGroup.actionOrCancel(
              actionText: 'Scan QR code',
              onActionPressed: () {},
              cancelText: 'Input serial number',
              onCancelPressed: () => controller.nextStep(),
            ),
          ),
          YgWizardStep(
            title: 'Manual identification',
            contentBuilder: (_) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const YgSection.column(
                  children: <Widget>[
                    Text('Please input the serial number that is located on the bottom of the SmartHub.'),
                    YgTextField(
                      label: 'Serial Number',
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                      autocorrect: false,
                      textCapitalization: TextCapitalization.none,
                      placeholder: '000 000 000 XXX XXX XXX',
                    ),
                  ],
                ),
                const YgSection.base(
                  child: Text(
                    'Are you experiencing a problem or unsure about what to do? Check out our troubleshooting tips.',
                  ),
                ),
                YgSection.base(
                  child: YgButton(
                    variant: YgButtonVariant.secondary,
                    size: YgButtonSize.small,
                    onPressed: () {},
                    child: const Text('Troubleshooting tips'),
                  ),
                ),
              ],
            ),
            buttons: YgButtonGroup.actionOrCancel(
              actionText: 'Pair Smarthub',
              onActionPressed: () {},
              cancelText: 'Back to previous step',
              onCancelPressed: () => controller.previousStep(),
            ),
          ),
        ],
      ),
    );
  }
}
