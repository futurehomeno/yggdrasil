import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class ProgressIndicatorScreen extends StatelessWidget {
  const ProgressIndicatorScreen({super.key});

  static const String routeName = 'ProgressIndicatorScreen';

  static PageRouteBuilder<Widget> route() {
    return YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const ProgressIndicatorScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const DemoScreen(
      componentName: 'ProgressIndicator',
      componentDesc: 'ProgressIndicators',
      supernovaLink: 'Link',
      child: Column(
        children: <Widget>[
          YgLinearProgressIndicator(value: 0.00),
          YgLinearProgressIndicator(value: 0.25),
          YgLinearProgressIndicator(value: 0.50),
          YgLinearProgressIndicator(value: 0.75),
          YgLinearProgressIndicator(value: 1.00),
          YgCircularProgressIndicator(value: 0.00),
          YgCircularProgressIndicator(value: 0.25),
          YgCircularProgressIndicator(value: 0.50),
          YgCircularProgressIndicator(value: 0.75),
          YgCircularProgressIndicator(value: 1.00),
        ],
      ),
    );
  }
}
