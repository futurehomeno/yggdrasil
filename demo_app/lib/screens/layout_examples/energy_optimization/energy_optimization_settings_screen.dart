import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class EnergyOptimizationSettingsScreen extends StatelessWidget {
  const EnergyOptimizationSettingsScreen({super.key});

  static const String routeName = 'EnergyOptimizationSettingsScreen';

  static PageRouteBuilder<Widget> route() {
    return const YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const EnergyOptimizationSettingsScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const DemoScreen(
      componentName: 'Energy Optimization',
      child: YgLayoutBody(
        child: Column(
          children: <Widget>[
            // Section 1: Price guard
            YgSection.list(
              title: 'Price guard',
              children: <Widget>[
                YgListTile(
                  title: 'Delivery area',
                  subtitle: 'Determines your local energy pricing zone',
                  leadingWidgets: <Widget>[YgIcon(YgIcons.pin)],
                  trailingWidgets: <Widget>[
                    YgTag(
                      size: YgTagSize.small,
                      variant: YgTagVariant.neutral,
                      child: Text('NO2'),
                    ),
                    YgIcon(YgIcons.caretRight),
                  ],
                ),
                YgListTile(
                  title: 'Energy price',
                  subtitle:
                      'Energy usage will be optimised based on your local energy prices',
                  leadingWidgets: <Widget>[YgIcon(YgIcons.moneyBag)],
                  trailingWidgets: <Widget>[
                    YgTag(
                      size: YgTagSize.small,
                      variant: YgTagVariant.neutral,
                      child: Text('Fixed price'),
                    ),
                    YgTag(
                      size: YgTagSize.small,
                      variant: YgTagVariant.neutral,
                      child: Text('3/4'),
                    ),
                    YgIcon(YgIcons.caretRight),
                  ],
                ),
                YgListTile(
                  title: 'Charging schedule',
                  subtitle: 'Set preferred charging times for lower rates',
                  leadingWidgets: <Widget>[YgIcon(YgIcons.peakTimer)],
                  trailingWidgets: <Widget>[
                    YgTag(
                      size: YgTagSize.small,
                      variant: YgTagVariant.neutral,
                      child: Text('06:00–18:00'),
                    ),
                    YgIcon(YgIcons.caretRight),
                  ],
                ),
              ],
            ),

            // Section 2: Max guard
            YgSection.list(
              title: 'Max guard',
              children: <Widget>[
                YgListTile(
                  title: 'Consumption limit',
                  subtitle:
                      'Maintains hourly energy threshold to avoid peak grid tariffs',
                  leadingWidgets: <Widget>[YgIcon(YgIcons.power)],
                  trailingWidgets: <Widget>[
                    YgTag(
                      size: YgTagSize.small,
                      variant: YgTagVariant.neutral,
                      child: Text('5.0 kWh'),
                    ),
                    YgTag(
                      size: YgTagSize.small,
                      variant: YgTagVariant.neutral,
                      child: Text('3/8'),
                    ),
                    YgIcon(YgIcons.caretRight),
                  ],
                ),
                YgListTile(
                  title: 'Peak average vs consumption limit',
                  subtitle:
                      'Compares your peak usage average against the configured limit',
                  leadingWidgets: <Widget>[YgIcon(YgIcons.power)],
                  trailingWidgets: <Widget>[
                    YgTag(
                      size: YgTagSize.small,
                      variant: YgTagVariant.positive,
                      child: Text('OK'),
                    ),
                    YgIcon(YgIcons.caretRight),
                  ],
                ),
              ],
            ),

            // Section 3: Dynamic load balancing
            YgSection.list(
              title: 'Dynamic load balancing',
              children: <Widget>[
                YgListTile(
                  title: 'Dynamic load balancing',
                  subtitle:
                      'Balances the consumption of your devices to protect the main breaker',
                  leadingWidgets: <Widget>[YgIcon(YgIcons.power)],
                  trailingWidgets: <Widget>[
                    YgTag(
                      size: YgTagSize.small,
                      variant: YgTagVariant.neutral,
                      child: Text('40 A'),
                    ),
                    YgTag(
                      size: YgTagSize.small,
                      variant: YgTagVariant.neutral,
                      child: Text('1/3'),
                    ),
                    YgIcon(YgIcons.caretRight),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
