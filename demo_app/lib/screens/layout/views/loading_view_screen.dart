import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class LoadingViewScreen extends StatelessWidget {
  const LoadingViewScreen({super.key});

  static const String routeName = 'LoadingViewScreen';

  static PageRouteBuilder<Widget> route() {
    return const YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const LoadingViewScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const DemoScreen(
      componentName: 'LoadingView',
      child: YgLoadingView(),
    );
  }
}
