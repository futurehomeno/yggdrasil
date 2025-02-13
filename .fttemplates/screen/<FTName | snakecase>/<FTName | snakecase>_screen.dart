import 'package:flutter/material.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class [FTName | pascalcase]Screen extends StatelessWidget {
  const [FTName | pascalcase]Screen({super.key});

  static const String routeName = '[FTName | pascalcase]Screen';

  static PageRouteBuilder<Widget> route() {
    return const YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const [FTName | pascalcase]Screen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const DemoScreen(
      componentName: '[FTName | pascalcase]',
      child: YgLayoutBody(
        child: Column(
          children: <Widget>[],
        )
      ),
    );
  }
}
