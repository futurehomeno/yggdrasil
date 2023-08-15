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
          YgListTile(title: 'Linear progress indicator'),
          YgLinearProgressIndicator(),
          YgListTile(title: 'Linear progress indicator with 0.25 value'),
          YgLinearProgressIndicator(value: 0.25),
          YgListTile(title: 'Linear progress indicator with 0.5 value'),
          YgLinearProgressIndicator(value: 0.5),
          YgListTile(title: 'Linear progress indicator with 0.75 value'),
          YgLinearProgressIndicator(value: 0.75),
          YgListTile(title: 'Linear progress indicator with 1.0 value'),
          YgLinearProgressIndicator(value: 1.0),
          YgListTile(title: 'Circular progress indicator'),
          YgCircularProgressIndicator(),
          YgListTile(title: 'Circular progress indicator with 0.25 value'),
          YgCircularProgressIndicator(value: 0.25),
          YgListTile(title: 'Circular progress indicator with 0.5 value'),
          YgCircularProgressIndicator(value: 0.5),
          YgListTile(title: 'Circular progress indicator with 0.75 value'),
          YgCircularProgressIndicator(value: 0.75),
          YgListTile(title: 'Circular progress indicator with 1.0 value'),
          YgCircularProgressIndicator(value: 1.0),
        ],
      ),
    );
  }
}
