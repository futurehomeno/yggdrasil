import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class DividerScreen extends StatelessWidget {
  const DividerScreen({super.key});

  static const String routeName = 'DividerScreen';

  static PageRouteBuilder<Widget> route() {
    return YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const DividerScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return YgScreen(
      componentName: 'Divider',
      componentDesc: 'Dividers',
      supernovaLink: 'Link',
      child: Column(
        children: <Widget>[
          YgListTile(title: 'Normal Divider'),
          const YgDivider(),
          YgListTile(title: 'Divider /w start indent'),
          const YgDivider(indent: YgDividerIndent.large),
          YgListTile(title: 'Divider w/ end indent'),
          const YgDivider(endIndent: YgDividerIndent.large),
          YgListTile(title: 'Divider w/ both indent'),
          const YgDivider(
            indent: YgDividerIndent.large,
            endIndent: YgDividerIndent.large,
          ),
        ],
      ),
    );
  }
}
