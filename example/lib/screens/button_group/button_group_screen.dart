import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class ButtonGroupScreen extends StatelessWidget {
  const ButtonGroupScreen({super.key});

  static const String routeName = 'ButtonGroupScreen';

  static PageRouteBuilder<Widget> route() {
    return const YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const ButtonGroupScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DemoScreen(
      componentName: 'ButtonGroup',
      child: Column(
        children: <Widget>[
          YgSection.base(
            title: 'Button group with 1 button',
            child: YgButtonGroup(
              children: <YgButton>[
                YgButton(
                  variant: YgButtonVariant.primary,
                  size: YgButtonSize.medium,
                  onPressed: () {},
                  child: const Text('Button 1'),
                ),
              ],
            ),
          ),
          YgSection.base(
            title: 'Button group with 2 buttons',
            child: YgButtonGroup(
              children: <YgButton>[
                YgButton(
                  variant: YgButtonVariant.primary,
                  size: YgButtonSize.medium,
                  onPressed: () {},
                  child: const Text('Button 1'),
                ),
                YgButton(
                  variant: YgButtonVariant.secondary,
                  size: YgButtonSize.medium,
                  onPressed: () {},
                  child: const Text('Button 2'),
                ),
              ],
            ),
          ),
          YgSection.base(
            title: 'Button group with 3 buttons',
            child: YgButtonGroup(
              children: <YgButton>[
                YgButton(
                  variant: YgButtonVariant.primary,
                  size: YgButtonSize.medium,
                  onPressed: () {},
                  child: const Text('Primary'),
                ),
                YgButton(
                  variant: YgButtonVariant.secondary,
                  size: YgButtonSize.medium,
                  onPressed: () {},
                  child: const Text('Secondary'),
                ),
                YgButton(
                  variant: YgButtonVariant.critical,
                  size: YgButtonSize.medium,
                  onPressed: () {},
                  child: const Text('Critical'),
                ),
              ],
            ),
          ),
          YgSection.base(
            title: 'Action or cancel group.',
            child: YgButtonGroup.actionOrCancel(
              actionText: 'Save',
              cancelText: 'Cancel',
              onActionPressed: () {},
              onCancelPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
