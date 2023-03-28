import 'package:flutter/material.dart';
import 'package:yggdrasil/app/core/_core.dart';
import 'package:yggdrasil/app/widgets/yg_screen.dart';
import 'package:yggdrasil/src/components/yg_buttons/yg_primary_button.dart';

class ButtonsScreen extends StatelessWidget {
  const ButtonsScreen({super.key});

  static const String routeName = 'ButtonsScreen';

  static PageRouteBuilder<Widget> route() {
    return YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const ButtonsScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return YgScreen(
      componentName: 'Button',
      componentDesc: 'Button',
      supernovaLink: 'Link',
      child: Column(
        children: <Widget>[
          TextButton(
            onPressed: () {},
            child: const Text('TextButton'),
          ),
          OutlinedButton(
            onPressed: () {},
            child: const Text('OutlinedButton'),
          ),
          YgPrimaryButton(
            onPressed: () {},
            child: const Text('YgPrimaryButton'),
          ),
        ],
      ),
    );
  }
}
