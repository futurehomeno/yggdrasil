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
          const YgIcon(icon: 'icon'),
          YgListTile(title: 'Clickable icon'),
          YgIcon(
            icon: 'icon',
            onTap: () {},
          ),
          YgListTile(title: 'Clickable icon w/ large area'),
          YgIcon(
            icon: 'icon',
            onTap: () {},
            tapSize: YgIconTapSize.largest,
          )
        ],
      ),
    );
  }
}
