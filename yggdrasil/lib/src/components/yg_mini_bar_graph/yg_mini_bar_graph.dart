// ignore_for_file: prefer-single-widget-per-file

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_mini_bar_graph/yg_mini_bar_graph_painter.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/yggdrasil.dart';

/// The implementation of the spot price bar graph.
class YgMiniBarGraph extends StatelessWidget with StatelessWidgetDebugMixin {
  const YgMiniBarGraph({
    super.key,
    required this.bars,
    required this.minBarCount,
    required this.currentBarIndex,
    required this.leadingBars,
    required this.metric,
  });

  /// The bars which will be rendered in the graph.
  final List<YgBarGraphBar>? bars;

  /// The minimum amount of bars that should be rendered at all times.
  final int minBarCount;

  /// The index on current bar in the list of [bars].
  final int currentBarIndex;

  /// The amount of bars that should be shown in front of the current bar.
  final int leadingBars;

  /// The metric shown next to the value.
  final String metric;

  @override
  Widget build(BuildContext context) {
    final YgMiniBarGraphTheme theme = context.miniBarGraphTheme;

    final YgBarGraphBar? currentBar = bars?.elementAtOrNull(currentBarIndex);
    final double currentValue = currentBar?.value ?? 0;
    final String currentValueString = currentValue.toStringAsFixed(min(2, currentValue.precision));

    final Color valueColor;
    if (currentBar == null) {
      valueColor = theme.valueTextColorDisabled;
    } else {
      valueColor = switch (currentBar.variant) {
        BarVariant.high => theme.valueTextColorWarning,
        BarVariant.low => theme.valueTextColorPositive,
        null => theme.valueTextColorNeutral,
      };
    }

    return Padding(
      padding: theme.graphPadding,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                currentValueString,
                style: theme.valueTextStyle.copyWith(
                  color: valueColor,
                ),
              ),
              SizedBox(
                width: theme.valueTextMetricSpacing,
              ),
              Text(
                metric,
                style: theme.metricTextStyle,
              ),
            ],
          ),
          SizedBox(
            height: theme.valueTextBarGraphSpacing,
          ),
          Flexible(
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                final double height;
                if (constraints.hasBoundedHeight) {
                  height = constraints.maxHeight;
                } else {
                  height = constraints.constrainHeight(theme.minGraphHeight);
                }

                return SizedBox(
                  width: constraints.maxWidth,
                  height: height,
                  child: CustomPaint(
                    painter: YgMiniBarGraphPainter(
                      bars: bars,
                      minBarCount: minBarCount,
                      currentBarIndex: currentBarIndex,
                      leadingBars: leadingBars,
                      theme: theme,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
