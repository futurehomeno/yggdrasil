import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class ChartScreen extends StatelessWidget {
  const ChartScreen({super.key});

  static const String routeName = 'ChartScreen';

  static PageRouteBuilder<Widget> route() {
    return const YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const ChartScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const DemoScreen(
      componentName: 'Chart',
      child: YgLayoutBody(
        child: Column(
          children: <Widget>[],
        ),
      ),
    );
  }
}
