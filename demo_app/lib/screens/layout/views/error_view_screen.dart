import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class ErrorViewScreen extends StatelessWidget {
  const ErrorViewScreen({super.key});

  static const String routeName = 'ErrorViewScreen';

  static PageRouteBuilder<Widget> route() {
    return const YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const ErrorViewScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const DemoScreen(
      componentName: 'ErrorView',
      child: YgErrorView(
        error: 'Error message',
      ),
    );
  }
}
