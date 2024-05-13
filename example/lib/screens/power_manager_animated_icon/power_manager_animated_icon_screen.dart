import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class PowerManagerAnimatedIconScreen extends StatelessWidget {
  const PowerManagerAnimatedIconScreen({super.key});

  static const String routeName = 'PowerManagerAnimatedIconScreen';

  static PageRouteBuilder<Widget> route() {
    return const YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const PowerManagerAnimatedIconScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DemoScreen(
      componentName: 'PowerManagerAnimatedIcon',
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(100.0),
            child: Transform.scale(
              scale: 5,
              child: const ColoredBox(
                color: Colors.black12,
                child: YgPowerManagerAnimatedIcon(
                  variant: YgPowerMangerAnimatedIconVariant.increase,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
