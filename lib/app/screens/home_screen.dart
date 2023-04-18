import 'package:flutter/material.dart';
import 'package:yggdrasil/app/core/_core.dart';
import 'package:yggdrasil/app/widgets/_widgets.dart';

import 'buttons_screen.dart';
import 'tags_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String routeName = 'HomeScreen';

  static PageRouteBuilder<Widget> route() {
    return YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const HomeScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return YgScreen(
      componentName: 'Home',
      componentDesc: 'List of supported components.',
      supernovaLink: '-',
      child: Column(
        children: <Widget>[
          ListTile(
            title: const Text('Buttons'),
            onTap: () {
              sl<YgRouter>().push(ButtonsScreen.route());
            },
          ),
          ListTile(
            title: const Text('Tags'),
            onTap: () {
              sl<YgRouter>().push(TagsScreen.route());
            },
          ),
        ],
      ),
    );
  }
}
