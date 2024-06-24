import 'dart:math';

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

  static const _defaultBars = [
    YgBarGraphBar(value: -88, variant: BarVariant.low),
    YgBarGraphBar(value: 50, variant: BarVariant.low),
    YgBarGraphBar(value: 180, variant: BarVariant.high),
    YgBarGraphBar(value: 150, variant: BarVariant.high),
    YgBarGraphBar(value: 250, variant: BarVariant.high),
    YgBarGraphBar(value: 80, variant: BarVariant.low),
    YgBarGraphBar(value: 100, variant: BarVariant.low),
    YgBarGraphBar(value: -20, variant: BarVariant.low),
    YgBarGraphBar(value: 160, variant: BarVariant.high),
  ];

  @override
  Widget build(BuildContext context) {
    return DemoScreen(
      componentName: 'MiniBarGraph',
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          YgSection(
            title: 'Default YgMiniBarGraph',
            child: _buildDefaultBarGraph(bars: _generateGraphData(48, 87692)),
          ),
          YgSection(
            title: 'YgMiniBarGraph without Data',
            child: _buildDefaultBarGraph(
              bars: null,
            ),
          ),
          YgSection(
            title: 'YgMiniBarGraph without Variants',
            child: _buildDefaultBarGraph(
              bars: _generateGraphData(48, 87692, false),
            ),
          ),
          YgSection(
            title: 'YgMiniBarGraph in a large card',
            child: Row(
              children: [
                GraphCard(
                  child: _buildDefaultBarGraph(),
                ),
                GraphCard(
                  child: _buildDefaultBarGraph(),
                ),
              ].withHorizontalSpacing(10),
            ),
          ),
          YgSection(
            title: 'YgMiniBarGraph in a medium card',
            child: Row(
              children: [
                GraphCard(
                  child: _buildDefaultBarGraph(),
                ),
                GraphCard(
                  child: _buildDefaultBarGraph(),
                ),
                GraphCard(
                  child: _buildDefaultBarGraph(),
                ),
              ].withHorizontalSpacing(10),
            ),
          ),
          YgSection(
            title: 'YgMiniBarGraph in a small card',
            child: Row(
              children: [
                GraphCard(
                  child: _buildDefaultBarGraph(),
                ),
                GraphCard(
                  child: _buildDefaultBarGraph(),
                ),
                GraphCard(
                  child: _buildDefaultBarGraph(),
                ),
                GraphCard(
                  child: _buildDefaultBarGraph(),
                ),
              ].withHorizontalSpacing(10),
            ),
          ),
        ],
      ),
    );
  }

  _buildDefaultBarGraph({
    List<YgBarGraphBar>? bars = _defaultBars,
    int minBarCount = 9,
    int currentBarIndex = 3,
    int leadingBars = 2,
  }) {
    return YgMiniBarGraph(
      bars: bars,
      currentBarIndex: currentBarIndex,
      leadingBars: leadingBars,
      minBarCount: minBarCount,
      metric: 'øre',
    );
  }

  List<YgBarGraphBar> _generateGraphData(int count, int seed, [bool withVariants = true]) {
    final random = Random(seed);

    return List<YgBarGraphBar>.generate(
      count,
      (int index) {
        final value = (random.nextDouble() * 200).floorToDouble();

        return YgBarGraphBar(
          value: value,
          variant: !withVariants
              ? null
              : value > 100
                  ? BarVariant.high
                  : BarVariant.low,
        );
      },
    );
  }
}

class GraphCard extends StatelessWidget {
  const GraphCard({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: YgCard(
        variant: YgCardVariant.outlined,
        child: AspectRatio(
          aspectRatio: 1,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: [
                Expanded(
                  child: child,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
