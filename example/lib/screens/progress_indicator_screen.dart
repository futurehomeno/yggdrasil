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
    return DemoScreen(
      componentName: 'ProgressIndicator',
      componentDesc: 'ProgressIndicators',
      supernovaLink: 'Link',
      child: Column(
        children: <Widget>[
          const YgListTile(title: 'Linear progress indicator'),
          const YgLinearProgressIndicator(),
          const YgListTile(title: 'Linear progress indicator with 0.25 value'),
          const YgLinearProgressIndicator(value: 0.25),
          const YgListTile(title: 'Linear progress indicator with 0.5 value'),
          const YgLinearProgressIndicator(value: 0.5),
          const YgListTile(title: 'Linear progress indicator with 0.75 value'),
          const YgLinearProgressIndicator(value: 0.75),
          const YgListTile(title: 'Linear progress indicator with 1.0 value'),
          const YgLinearProgressIndicator(value: 1.0),
          const YgListTile(title: 'Circular progress indicator'),
          const YgCircularProgressIndicator(),
          const YgListTile(title: 'Circular progress indicator with 0.25 value'),
          const YgCircularProgressIndicator(value: 0.25),
          const YgListTile(title: 'Circular progress indicator with 0.5 value'),
          const YgCircularProgressIndicator(value: 0.5),
          const YgListTile(title: 'Circular progress indicator with 0.75 value'),
          const YgCircularProgressIndicator(value: 0.75),
          const YgListTile(title: 'Circular progress indicator with 1.0 value'),
          const YgCircularProgressIndicator(value: 1.0),
        ].withVerticalSpacing(10),
      ),
    );
  }
}
