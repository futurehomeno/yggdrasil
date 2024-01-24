import 'package:flutter/material.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class StickyFooterScreen extends StatelessWidget {
  const StickyFooterScreen({super.key});

  static const String routeName = 'StickyFooterScreen';

  static PageRouteBuilder<Widget> route() {
    return const YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const StickyFooterScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const DemoScreen(
      componentName: 'StickyFooter',
      child: Column(
        children: <Widget>[
          DemoPlaceholder(
            height: 300,
          ),
        ],
      ),
    );
  }
}

// class StickyFooterLayout extends SingleChildRenderObjectWidget {
//   const StickyFooterLayout({super.key});
// }
