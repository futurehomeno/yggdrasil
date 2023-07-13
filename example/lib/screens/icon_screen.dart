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
    return YgScreen(
      componentName: 'Icon',
      componentDesc: 'Icons',
      supernovaLink: 'Link',
      child: Column(
        children: <Widget>[
          YgListTile(title: 'Normal icon'),
          const YgIcon(
            icon: SharedIcons.other25,
            size: YgIconSize.large,
          ),
          YgListTile(
            title: 'Inverted icon on a dark background',
            subtitle: 'These still look good when switching from light mode to dark mode.',
          ),
          YgTag(
            variant: YgTagVariant.positive,
            weight: YgTagWeight.strong,
            onPressed: () {},
            child: const YgIcon(
              icon: SharedIcons.other25,
              size: YgIconSize.large,
              invertColor: true,
            ),
          ),
          YgListTile(
            title: 'Icon with color from svg',
            subtitle: 'Used when icons come with multiple colors.',
          ),
          const YgIcon(
            icon: MduIcons.sdcoOkColor25,
            size: YgIconSize.large,
            useSvgColor: true,
          ),
          YgListTile(title: 'Clickable icon'),
          YgIcon(
            icon: SharedIcons.other25,
            onTap: () {},
          ),
          YgListTile(title: 'Clickable icon w/ large area'),
          YgIcon(
            icon: SharedIcons.other25,
            onTap: () {},
            tapSize: YgIconTapSize.largest,
          )
        ],
      ),
    );
  }
}
