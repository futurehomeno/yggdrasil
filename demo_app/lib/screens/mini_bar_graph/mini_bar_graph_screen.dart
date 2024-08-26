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
    YgBarGraphBar(value: -10, variant: BarVariant.low, metric: 'øre', valueText: '-88'),
    YgBarGraphBar(value: -10, variant: BarVariant.low, metric: 'øre', valueText: '50'),
    YgBarGraphBar(value: -10, variant: BarVariant.high, metric: 'øre', valueText: '180'),
    YgBarGraphBar(value: -10, variant: BarVariant.high, metric: 'øre', valueText: '150'),
    YgBarGraphBar(value: -10, variant: BarVariant.high, metric: 'øre', valueText: '250'),
    YgBarGraphBar(value: -10, variant: BarVariant.low, metric: 'øre', valueText: '80'),
    YgBarGraphBar(value: 0, variant: BarVariant.low, metric: 'øre', valueText: '100'),
    YgBarGraphBar(value: -10, variant: BarVariant.low, metric: 'øre', valueText: '-20'),
    YgBarGraphBar(value: -10, variant: BarVariant.high, metric: 'øre', valueText: '160'),
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
    int currentBarIndex = 2,
    int leadingBars = 2,
  }) {
    return YgMiniBarGraph(
      bars: bars,
      currentBarIndex: currentBarIndex,
      leadingBars: leadingBars,
      minBarCount: minBarCount,
    );
  }

  List<YgBarGraphBar> _generateGraphData(int count, int seed, [bool withVariants = true]) {
    final random = Random(seed);

    return List<YgBarGraphBar>.generate(
      count,
      (int index) {
        final value = (random.nextDouble() * 200).floor();

        BarVariant? variant = null;
        if (withVariants) {
          if (value > 100) {
            variant = BarVariant.high;
          } else {
            variant = BarVariant.low;
          }
        }

        return YgBarGraphBar(
          value: value.toDouble(),
          variant: variant,
          metric: 'øre',
          valueText: value.toString(),
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
            child: child,
          ),
        ),
      ),
    );
  }
}
