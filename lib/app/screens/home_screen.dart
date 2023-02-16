import 'package:flutter/material.dart';
import 'package:yggdrasil/app/core/_core.dart';

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
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ListTile(
              title: const Text('Buttons'),
              onTap: () {
                sl<YgRouter>().push(ButtonsScreen.route());
              },
            ),
          ],
        ),
      ),
    );
  }
}
