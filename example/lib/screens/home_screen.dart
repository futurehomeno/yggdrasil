import 'package:flutter/material.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/screens/_screens.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

import 'badge_screen.dart';
import 'bottom_sheet_screen.dart';
import 'buttons_screen.dart';
import 'dialog_screen.dart';
import 'text_link_screen.dart';

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
            title: const Text('Bottom sheet'),
            onTap: () {
              sl<YgRouter>().push(BottomSheetScreen.route());
            },
          ),
          ListTile(
            title: const Text('Badge'),
            onTap: () {
              sl<YgRouter>().push(BadgeScreen.route());
            },
          ),
          ListTile(
            title: const Text('Callout'),
            onTap: () {
              sl<YgRouter>().push(CalloutScreen.route());
            },
          ),
          ListTile(
            title: const Text('Dialog'),
            onTap: () {
              sl<YgRouter>().push(DialogScreen.route());
            },
          ),
          ListTile(
            title: const Text('Text link'),
            onTap: () {
              sl<YgRouter>().push(TextLinkScreen.route());
            },
          ),
        ],
      ),
    );
  }
}
