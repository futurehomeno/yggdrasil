import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class IconsListScreen extends StatelessWidget {
  const IconsListScreen({super.key});

  static const String routeName = 'IconsList';

  static PageRouteBuilder<Widget> route() {
    return YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const IconsListScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return YgScreen(
      scrollable: false,
      componentName: 'Icon',
      componentDesc: 'Icons',
      supernovaLink: 'Link',
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: YgIcons.allIconPaths.length,
        itemBuilder: (BuildContext context, int index) {
          final String iconPath = YgIcons.allIconPaths[index];
          final String iconName = YgIcons.allIconNames[index];

          return YgListTile(
            title: iconName,
            subtitle: iconPath,
            leadingWidgets: <YgIcon>[
              YgIcon(iconPath, useEmbeddedColor: true),
            ],
          );
        },
      ),
    );
  }
}
