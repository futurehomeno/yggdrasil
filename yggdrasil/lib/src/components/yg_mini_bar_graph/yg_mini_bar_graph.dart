// ignore_for_file: prefer-single-widget-per-file

import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_mini_bar_graph/enums/bar_variant.dart';
import 'package:yggdrasil/src/components/yg_mini_bar_graph/models/yg_bar_graph_bar.dart';
import 'package:yggdrasil/src/theme/_theme.dart';

import 'yg_mini_bar_graph_render_widget.dart';

class YgMiniBarGraph extends StatefulWidget {
  const YgMiniBarGraph({super.key});

  @override
  State<YgMiniBarGraph> createState() => YgMiniBarGraphState();
}

class YgMiniBarGraphState extends State<YgMiniBarGraph> {
  @override
  Widget build(BuildContext context) {
    final YgMiniBarGraphTheme theme = context.miniBarGraphTheme;

    return Padding(
      padding: theme.graphPadding,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                '-43',
                style: theme.valueTextStyle,
              ),
              SizedBox(
                width: theme.valueTextMetricSpacing,
              ),
              Text(
                'ore',
                style: theme.metricTextStyle,
              ),
            ],
          ),
          SizedBox(
            height: theme.valueTextBarGraphSpacing,
          ),
          Expanded(
            child: YgMiniBarGraphRenderWidget(
              values: List<YgBarGraphBar>.generate(
                9,
                (int index) => YgBarGraphBar(
                  value: index.toDouble(),
                  variant: switch ((index / 2).floor() % 3) {
                    1 => BarVariant.high,
                    2 => BarVariant.low,
                    _ => BarVariant.unknown,
                  },
                ),
              ),
              minBarCount: 9,
              currentBarIndex: 3,
              leadingBars: 2,
            ),
          ),
        ],
      ),
    );
  }
}
