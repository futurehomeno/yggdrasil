import 'package:flutter/material.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class SearchBarScreen extends StatelessWidget {
  const SearchBarScreen({super.key});

  static const String routeName = 'SearchBarScreen';

  static PageRouteBuilder<Widget> route() {
    return const YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const SearchBarScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const DemoScreen(
      componentName: 'SearchBar',
      child: Column(
        children: <Widget>[],
      ),
    );
  }
}
