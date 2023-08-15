import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class GaugeScreen extends StatelessWidget {
  const GaugeScreen({super.key});

  static const String routeName = 'GaugeScreen';

  static PageRouteBuilder<Widget> route() {
    return YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const GaugeScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const DemoScreen(
      componentName: 'Gauge',
      componentDesc: 'Gauges',
      supernovaLink: 'Link',
      child: Column(
        children: <Widget>[
          YgListTile(title: 'Gauge'),
          Row(
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
          Row(
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
          YgListTile(title: 'Disabled gauge'),
          Row(
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
          YgListTile(title: 'Child variations'),
          Row(
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
          Row(
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
        ],
      ),
    );
  }
}
