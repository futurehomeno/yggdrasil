import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class TabsScreen extends StatelessWidget {
  const TabsScreen({super.key});

  static const String routeName = 'TabsScreen';

  static PageRouteBuilder<Widget> route() {
    return const YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const TabsScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const DemoScreen(
      componentName: 'Tabs',
      componentDesc: 'Tabs',
      supernovaLink: 'Link',
      child: Column(
        children: <Widget>[
          YgListTile(
            title: 'YgTabBar with label only',
          ),
          YgTabBar(
            tabs: <YgTab>[
              YgTab(
                label: 'Tab',
              ),
              YgTab(
                label: 'Tab',
              ),
              YgTab(
                label: 'Tab',
              ),
              YgTab(
                label: 'Tab',
              ),
            ],
          ),
          // SizedBox(height: 20.0),
          // YgListTile(
          //   title: 'YgTabBar with icon only',
          // ),
          // YgTabBar(
          //   tabs: <YgTab>[
          //     YgTab(
          //       icon: YgIcon(YgIcons.deviceHub),
          //     ),
          //     YgTab(
          //       icon: YgIcon(YgIcons.info),
          //     ),
          //     YgTab(
          //       icon: YgIcon(YgIcons.alert),
          //     ),
          //     YgTab(
          //       icon: YgIcon(YgIcons.map),
          //     ),
          //   ],
          // ),
          // SizedBox(height: 20.0),
          // YgListTile(
          //   title: 'YgTabBar with both label and icon, and scrollable',
          // ),
          // YgTabBar(
          //   isScrollable: true,
          //   tabs: <YgTab>[
          //     YgTab(
          //       label: 'Tab',
          //       icon: YgIcon(YgIcons.deviceHub),
          //     ),
          //     YgTab(
          //       label: 'Tab',
          //       icon: YgIcon(YgIcons.info),
          //     ),
          //     YgTab(
          //       label: 'Tab',
          //       icon: YgIcon(YgIcons.alert),
          //     ),
          //     YgTab(
          //       label: 'Tab',
          //       icon: YgIcon(YgIcons.map),
          //     ),
          //     YgTab(
          //       label: 'Tab',
          //       icon: YgIcon(YgIcons.camera),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
