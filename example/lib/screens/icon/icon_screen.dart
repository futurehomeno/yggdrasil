import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class IconScreen extends StatelessWidget {
  const IconScreen({super.key});

  static const String routeName = 'IconScreen';

  static PageRouteBuilder<Widget> route() {
    return const YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const IconScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DemoScreen(
      componentName: 'Icon',
      child: Column(
        children: <Widget>[
          const YgSection(
            title: 'Available icons',
            child: YgCallout(
              description: 'All currently supported icons can be seen on the icons list screen.',
            ),
          ),
          const YgSection(
            title: 'Sizes',
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                YgIcon(
                  YgIcons.info,
                  size: YgIconSize.small,
                ),
                YgIcon(
                  YgIcons.info,
                  size: YgIconSize.large,
                ),
              ],
            ),
          ),
          YgSection(
            title: 'Inherited color',
            subtitle: 'Color switching is handled by the parent widget.',
            child: YgIconButton(
              variant: YgIconButtonVariant.filled,
              child: const YgIcon(
                YgIcons.info,
                size: YgIconSize.large,
              ),
              onPressed: () {},
            ),
          ),
          const YgSection(
            title: 'Disabled color',
            subtitle: 'Color switching for state is handled by the parent widget.',
            child: YgButton(
              onPressed: null,
              child: YgIcon(
                YgIcons.info,
                size: YgIconSize.large,
              ),
            ),
          ),
          YgSection(
            title: 'Override color',
            subtitle: 'Override the default theme color. See warning below.',
            child: YgIconButton(
              onPressed: () {},
              variant: YgIconButtonVariant.filled,
              child: const YgIcon(
                YgIcons.deviceHubColorful,
                color: Colors.green,
                size: YgIconSize.large,
              ),
            ),
          ),
          YgSection(
            title: 'Use embedded color',
            subtitle: 'Color embedded in the SVG is used. See warning below.',
            child: YgIconButton(
              onPressed: () {},
              variant: YgIconButtonVariant.filled,
              child: const YgIcon(
                YgIcons.deviceHubColorful,
                useEmbeddedColor: true,
                size: YgIconSize.large,
              ),
            ),
          ),
          YgSection(
            title: 'Warning!',
            subtitle:
                'Overriding color by using either useEmbeddedColor or just setting a specific color will prevent the parent widget from being able to dynamically change the color based on theme or state changes. Use with caution, as end result may end up like the example below.',
            child: YgIconButton(
              onPressed: () {},
              variant: YgIconButtonVariant.filled,
              child: const YgIcon(
                YgIcons.deviceHubColorful,
                useEmbeddedColor: true,
                size: YgIconSize.large,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
