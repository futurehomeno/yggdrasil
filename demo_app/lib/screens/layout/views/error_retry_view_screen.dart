import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class ErrorRetryViewScreen extends StatelessWidget {
  const ErrorRetryViewScreen({super.key});

  static const String routeName = 'ErrorRetryViewScreen';

  static PageRouteBuilder<Widget> route() {
    return const YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const ErrorRetryViewScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DemoScreen(
      componentName: 'ErrorRetryView',
      child: YgErrorView(
        error: 'Error message',
        onRetry: () {},
      ),
    );
  }
}
