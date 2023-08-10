import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class GaugeScreen extends StatelessWidget {
  const GaugeScreen({super.key});

  static const String routeName = 'GaugeScreen';

  static PageRouteBuilder<Widget> route() {
    return YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const GaugeScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const DemoScreen(
      componentName: 'Gauge',
      componentDesc: 'Gauges',
      supernovaLink: 'Link',
      child: Column(
        children: <Widget>[
          YgGauge(
            value: 50.0,
          )
        ],
      ),
    );
  }
}
