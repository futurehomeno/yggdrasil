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
          const YgListTile(title: 'Normal icon'),
          const YgIcon(
            YgIcons.info,
            size: YgIconSize.large,
          ),
          const YgListTile(
            title: 'Inverted icon on a dark background',
            subtitle: 'These still look good when switching from light mode to dark mode.',
          ),
          YgTag(
            variant: YgTagVariant.positive,
            weight: YgTagWeight.strong,
            onPressed: () {},
            child: const YgIcon(
              YgIcons.info,
              size: YgIconSize.large,
              invertColor: true,
            ),
          ),
          const YgListTile(title: 'Clickable icon'),
          YgIcon(
            YgIcons.info,
            onTap: () {},
          ),
          const YgListTile(title: 'Clickable icon w/ large area'),
          YgIcon(
            YgIcons.info,
            onTap: () {},
            tapSize: YgIconTapSize.largest,
          ),
        ],
      ),
    );
  }
}
