import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class IconScreen extends StatelessWidget {
  const IconScreen({super.key});

  static const String routeName = 'IconScreen';

  static PageRouteBuilder<Widget> route() {
    return YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const IconScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const DemoScreen(
      componentName: 'Icon',
      componentDesc: 'Icons',
      supernovaLink: 'Link',
      child: Column(
        children: <Widget>[
          YgListTile(
            title: 'Available icons',
            subtitle: 'All currently supported icons can be seen on the icons list screen.',
          ),
          YgListTile(title: 'Sizes'),
          YgIcon(
            YgIcons.info,
            size: YgIconSize.small,
          ),
          YgIcon(
            YgIcons.info,
            size: YgIconSize.large,
          ),
          YgListTile(
            title: 'Inherited color',
            subtitle: 'Color switching is handled by the parent widget.',
          ),
          YgTag(
            weight: YgTagWeight.strong,
            child: YgIcon(
              YgIcons.info,
              size: YgIconSize.large,
            ),
          ),
          YgListTile(
            title: 'Disabled color',
            subtitle: 'Color switching for state is handled by the parent widget.',
          ),
          YgButton(
            onPressed: null,
            child: YgIcon(
              YgIcons.info,
              size: YgIconSize.large,
            ),
          ),
          YgListTile(
            title: 'Override color',
            subtitle: 'Override the default theme color. See warning below.',
          ),
          YgTag(
            child: YgIcon(
              YgIcons.deviceHub,
              color: Colors.green,
              size: YgIconSize.large,
            ),
          ),
          YgListTile(
            title: 'Use embedded color',
            subtitle: 'Color embedded in the SVG is used. See warning below.',
          ),
          YgTag(
            child: YgIcon(
              YgIcons.deviceHub,
              useEmbeddedColor: true,
              size: YgIconSize.large,
            ),
          ),
          YgListTile(
            title: 'Warning!',
            leadingWidgets: <Widget>[
              YgIcon(YgIcons.warning),
            ],
            subtitle:
                'Overriding color by using either useEmbeddedColor or just setting a specific color will prevent the parent widget from being able to dynamically change the color based on theme or state changes. Use with caution, as end result may end up like the example below.',
          ),
          YgTag(
            weight: YgTagWeight.strong,
            child: YgIcon(
              YgIcons.deviceHub,
              useEmbeddedColor: true,
              size: YgIconSize.large,
            ),
          ),
        ],
      ),
    );
  }
}
