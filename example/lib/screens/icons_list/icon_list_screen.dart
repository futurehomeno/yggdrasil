import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class IconListScreen extends StatelessWidget {
  const IconListScreen({super.key});

  static const String routeName = 'IconsList';

  static PageRouteBuilder<Widget> route() {
    return YgRouteBuilder().fadeTransition(
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
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                // ignore: avoid-unsafe-collection-methods
                final String iconPath = YgIcons.allIconPaths[index];
                // ignore: avoid-unsafe-collection-methods
                final String iconName = YgIcons.allIconNames[index];

                return YgListTile(
                  title: iconName,
                  subtitle: iconPath,
                  leadingWidgets: <YgIcon>[
                    YgIcon(iconPath, useEmbeddedColor: true),
                  ],
                );
              },
              childCount: YgIcons.allIconPaths.length,
            ),
          ),
        ],
      ),
    );
  }
}
