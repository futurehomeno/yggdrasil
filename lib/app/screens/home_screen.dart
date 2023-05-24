import 'package:flutter/material.dart';
import 'package:yggdrasil/app/core/_core.dart';
import 'package:yggdrasil/app/screens/test_sheet.dart';
import 'package:yggdrasil/app/widgets/_widgets.dart';

import 'bottom_sheet_screen.dart';
import 'buttons_screen.dart';

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
            title: const Text('Test sheet'),
            onTap: () {
              sl<YgRouter>().push(TestSheetScreen.route());
            },
          ),
        ],
      ),
    );
  }
}
