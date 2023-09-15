import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class IconListScreen extends StatelessWidget {
  const IconListScreen({super.key});

  static const String routeName = 'IconsList';

  static PageRouteBuilder<Widget> route() {
    return const YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const IconListScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DemoScreen(
      scrollable: false,
      componentName: 'Icon',
      componentDesc: 'Icons',
      supernovaLink: 'Link',
      child: CustomScrollView(
        slivers: <Widget>[
          SliverList.builder(
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
            itemCount: YgIcons.allIconPaths.length,
          ),
        ],
      ),
    );
  }
}
