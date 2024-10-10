import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class DeviceDetailsExample extends StatelessWidget {
  const DeviceDetailsExample({super.key});

  static const String routeName = 'DeviceDetailsExample';

  static PageRouteBuilder<Widget> route() {
    return const YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const DeviceDetailsExample(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DemoScreen(
      componentName: 'DeviceDetailsExample',
      child: Column(
        children: <Widget>[
          YgSection.list(
            children: <Widget>[
              YgListTile.link(
                link: 'Customize',
                icon: YgIcons.edit,
                onTap: () {},
              ),
            ],
          ),
          const YgSection(
            child: YgCard(
              variant: YgCardVariant.outlined,
              child: YgListTile(
                title: 'ELVA charge controls!',
                subtitle: 'Some cool controls inside this card.',
                leadingWidgets: <Widget>[
                  YgIcon(YgIcons.deviceEvChargerColorful),
                ],
              ),
            ),
          ),
          YgSection(
            child: YgCallout(
              variant: YgCalloutVariant.warning,
              description:
                  'The charger is currently unavailable for use. A scheduled maintenance or power outage may have caused this temporary issue.',
              textLink: YgTextLink(
                text: 'Troubleshooting',
                onPressed: () {},
              ),
            ),
          ),
          const YgSection.list(
            title: 'Detailed data',
            children: <Widget>[
              YgListTile(
                title: 'Power',
                leadingWidgets: <Widget>[YgIcon(YgIcons.power)],
                trailingWidgets: <Widget>[Text('0 kW')],
              ),
              YgListTile(
                title: 'Current',
                leadingWidgets: <Widget>[YgIcon(YgIcons.power)],
                trailingWidgets: <Widget>[Text('0 A')],
              ),
              YgListTile(
                title: 'Max current',
                leadingWidgets: <Widget>[YgIcon(YgIcons.power)],
                trailingWidgets: <Widget>[Text('16 A')],
              ),
              YgListTile(
                title: 'Voltage',
                leadingWidgets: <Widget>[YgIcon(YgIcons.power)],
                trailingWidgets: <Widget>[Text('220 V')],
              ),
              YgListTile(
                title: 'Phases',
                leadingWidgets: <Widget>[YgIcon(YgIcons.power)],
                trailingWidgets: <Widget>[
                  YgTag(
                    size: YgTagSize.small,
                    variant: YgTagVariant.warning,
                    child: Text('Danger!'),
                  ),
                ],
              ),
            ],
          ),
          YgSection.list(
            title: 'General settings',
            children: <Widget>[
              YgListTile.link(
                link: 'System data',
                icon: YgIcons.support,
                onTap: () {},
              ),
              YgListTile.link(
                link: 'Settings',
                icon: YgIcons.support,
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
