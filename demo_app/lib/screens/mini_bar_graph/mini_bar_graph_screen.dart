import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class MiniBarGraphScreen extends StatelessWidget {
  const MiniBarGraphScreen({super.key});

  static const String routeName = 'MiniBarGraphScreen';

  static PageRouteBuilder<Widget> route() {
    return const YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const MiniBarGraphScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DemoScreen(
      componentName: 'MiniBarGraph',
      child: Column(
        children: <Widget>[
          YgSection(
            title: 'Default bar graph',
            child: Row(
              children: [
                Expanded(
                  child: ExampleGraph(),
                ),
                Expanded(
                  child: ExampleGraph(),
                ),
              ].withHorizontalSpacing(10),
            ),
          ),
          YgSection(
            title: 'Default bar graph',
            child: Row(
              children: [
                Expanded(
                  child: ExampleGraph(),
                ),
                Expanded(
                  child: ExampleGraph(),
                ),
                Expanded(
                  child: ExampleGraph(),
                ),
              ].withHorizontalSpacing(10),
            ),
          ),
          YgSection(
            title: 'Default bar graph',
            child: Row(
              children: [
                Expanded(
                  child: ExampleGraph(),
                ),
                Expanded(
                  child: ExampleGraph(),
                ),
                Expanded(
                  child: ExampleGraph(),
                ),
                Expanded(
                  child: ExampleGraph(),
                ),
              ].withHorizontalSpacing(10),
            ),
          ),
        ],
      ),
    );
  }
}

class ExampleGraph extends StatelessWidget {
  const ExampleGraph({super.key});

  @override
  Widget build(BuildContext context) {
    return YgCard(
      variant: YgCardVariant.filled,
      child: AspectRatio(
        aspectRatio: 1,
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              Expanded(
                child: YgMiniBarGraph(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
