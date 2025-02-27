import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

import 'widgets/graph_card.dart';

class MiniBarGraphScreen extends StatelessWidget {
  const MiniBarGraphScreen({super.key});

  static const String routeName = 'MiniBarGraphScreen';

  static PageRouteBuilder<Widget> route() {
    return const YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const MiniBarGraphScreen(),
    );
  }

  static const List<YgBarGraphBar> _defaultBars = <YgBarGraphBar>[
    YgBarGraphBar(value: -88, variant: BarVariant.low, metric: 'øre', valueText: '-88'),
    YgBarGraphBar(value: 50, variant: BarVariant.low, metric: 'øre', valueText: '50'),
    YgBarGraphBar(value: 180, variant: BarVariant.high, metric: 'øre', valueText: '180'),
    YgBarGraphBar(value: 150, variant: BarVariant.high, metric: 'øre', valueText: '150'),
    YgBarGraphBar(value: 250, variant: BarVariant.high, metric: 'øre', valueText: '250'),
    YgBarGraphBar(value: 80, variant: BarVariant.low, metric: 'øre', valueText: '80'),
    YgBarGraphBar(value: 100, variant: BarVariant.low, metric: 'øre', valueText: '100'),
    YgBarGraphBar(value: -20, variant: BarVariant.low, metric: 'øre', valueText: '-20'),
    YgBarGraphBar(value: 160, variant: BarVariant.high, metric: 'øre', valueText: '160'),
  ];

  @override
  Widget build(BuildContext context) {
    return DemoScreen(
      componentName: 'MiniBarGraph',
      child: YgLayoutBody(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            YgSection(
              title: 'Default YgMiniBarGraph',
              child: _buildDefaultBarGraph(bars: _generateGraphData(48, 37245)),
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
                children: <GraphCard>[
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
                children: <GraphCard>[
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
                children: <GraphCard>[
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
      ),
    );
  }

  YgMiniBarGraph _buildDefaultBarGraph({
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
    final Random random = Random(seed);

    return List<YgBarGraphBar>.generate(
      count,
      (int index) {
        final int value = (random.nextDouble() * 200).floor();

        BarVariant? variant;
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
