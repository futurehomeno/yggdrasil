import 'dart:math';

import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class GaugeScreen extends StatefulWidget {
  const GaugeScreen({super.key});

  static const String routeName = 'GaugeScreen';

  static PageRouteBuilder<Widget> route() {
    return YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const GaugeScreen(),
    );
  }

  @override
  State<GaugeScreen> createState() => _GaugeScreenState();
}

class _GaugeScreenState extends State<GaugeScreen> {
  double value = 0;
  Random random = Random();

  @override
  Widget build(BuildContext context) {
    return DemoScreen(
      componentName: 'Gauge',
      componentDesc: 'Gauges',
      supernovaLink: 'Link',
      child: Column(
        children: <Widget>[
          const YgListTile(title: 'Gauge'),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox.square(
                dimension: 100,
                child: YgGauge(
                  value: 0.0,
                  title: '0.0',
                ),
              ),
              SizedBox.square(
                dimension: 100,
                child: YgGauge(
                  value: 1.0,
                  title: '1.0',
                ),
              ),
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox.square(
                dimension: 100,
                child: YgGauge(
                  value: 0.1,
                  title: '0.1',
                ),
              ),
              SizedBox.square(
                dimension: 100,
                child: YgGauge(
                  value: 0.5,
                  title: '0.5',
                ),
              ),
              SizedBox.square(
                dimension: 100,
                child: YgGauge(
                  value: 0.9,
                  title: '0.9',
                ),
              ),
            ],
          ),
          const YgListTile(title: 'Disabled gauge'),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox.square(
                dimension: 100,
                child: YgGauge(
                  value: null,
                  title: 'Disabled',
                  label: 'Disabled',
                ),
              ),
              SizedBox.square(
                dimension: 100,
                child: YgGauge(
                  value: null,
                  icon: YgIcon(YgIcons.info),
                  label: 'Disabled',
                ),
              ),
            ],
          ),
          const YgListTile(title: 'Child variations'),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox.square(
                dimension: 100,
                child: YgGauge(
                  value: 0.5,
                  title: 'Title',
                  icon: YgIcon(YgIcons.info),
                ),
              ),
              SizedBox.square(
                dimension: 100,
                child: YgGauge(
                  value: 0.5,
                  title: 'Title',
                  label: 'Label',
                ),
              ),
              SizedBox.square(
                dimension: 100,
                child: YgGauge(
                  value: 0.5,
                  title: 'Title',
                  notation: 'Notation',
                ),
              ),
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox.square(
                dimension: 100,
                child: YgGauge(
                  value: 0.5,
                  title: 'Title',
                  notation: 'Notation',
                  label: 'Label',
                ),
              ),
              SizedBox.square(
                dimension: 100,
                child: YgGauge(
                  value: 0.5,
                  icon: YgIcon(YgIcons.info),
                  label: 'Label',
                ),
              ),
              SizedBox.square(
                dimension: 100,
                child: YgGauge(
                  value: 0.5,
                  icon: YgIcon(YgIcons.info),
                ),
              ),
            ],
          ),
          const YgListTile(title: 'Responsive between ~90px and ~120px'),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox.square(
                dimension: 90,
                child: YgGauge(
                  value: 0.5,
                  title: '90px',
                ),
              ),
              SizedBox.square(
                dimension: 100,
                child: YgGauge(
                  value: 0.5,
                  title: '100px',
                ),
              ),
              SizedBox.square(
                dimension: 120,
                child: YgGauge(
                  value: 0.5,
                  title: '120px',
                ),
              ),
            ],
          ),
          const YgListTile(title: 'Flexible min / max'),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox.square(
                dimension: 100,
                child: YgGauge(
                  value: 42.0,
                  title: '42.0',
                  notation: 'from',
                  label: '30 to 50',
                  minValue: 30.0,
                  maxValue: 50.0,
                ),
              ),
              SizedBox.square(
                dimension: 100,
                child: YgGauge(
                  value: -3.0,
                  title: '-3.0',
                  notation: 'from',
                  label: '-10 to 10',
                  minValue: -10.0,
                  maxValue: 10.0,
                ),
              ),
            ],
          ),
          const YgListTile(title: 'Animated'),
          SizedBox.square(
            dimension: 120,
            child: YgGauge(
              value: value,
              buildTitle: (double value) => value.toStringAsFixed(0),
              label: 'Animated',
              maxValue: 100.0,
            ),
          ),
          YgButton(
            onPressed: () {
              value = random.nextInt(100).toDouble();
              setState(() {});
            },
            child: const Text('Change value'),
          ),
        ],
      ),
    );
  }
}
