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
      child: YgLayoutBody(
        child: Column(
          children: <Widget>[
            YgSection(
              title: 'Vertical group with 1 button',
              child: YgButtonGroup.vertical(
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
            YgSection(
              title: 'Vertical group with 2 buttons',
              child: YgButtonGroup.vertical(
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
            YgSection(
              title: 'Vertical group with 3 buttons',
              child: YgButtonGroup.vertical(
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
            YgSection(
              title: 'Vertical action or cancel group.',
              child: YgButtonGroup.verticalActionOrCancel(
                actionText: 'Save',
                cancelText: 'Cancel',
                onActionPressed: () {},
                onCancelPressed: () {},
              ),
            ),
            YgSection(
              title: 'Horizontal button group with 2 buttons.',
              child: YgButtonGroup.horizontal(
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
            YgSection(
              title: 'Horizontal button group with 3 buttons.',
              subtitle: 'Note that you have to specify overlflow.',
              child: YgButtonGroup.horizontal(
                children: <YgButton>[
                  YgButton(
                    variant: YgButtonVariant.primary,
                    size: YgButtonSize.medium,
                    onPressed: () {},
                    child: const Text(
                      'Long button 1',
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  YgButton(
                    variant: YgButtonVariant.secondary,
                    size: YgButtonSize.medium,
                    onPressed: () {},
                    child: const Text(
                      'Long button 2',
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  YgButton(
                    variant: YgButtonVariant.critical,
                    size: YgButtonSize.medium,
                    onPressed: () {},
                    child: const Text(
                      'Long button 3',
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
