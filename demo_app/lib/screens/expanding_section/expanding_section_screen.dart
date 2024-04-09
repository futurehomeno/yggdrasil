import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

import 'examples/_examples.dart';

class ExpandingSectionScreen extends StatelessWidget {
  const ExpandingSectionScreen({super.key});

  static const String routeName = 'ExpandingSectionScreen';

  static PageRouteBuilder<Widget> route() {
    return const YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const ExpandingSectionScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 3,
      child: DemoScreen(
        componentName: 'ExpandingSection',
        scrollable: false,
        bottom: YgTabBar(
          tabs: <YgTab>[
            YgTab(label: 'Regular'),
            YgTab(label: 'Column'),
            YgTab(label: 'List'),
          ],
        ),
        child: TabBarView(
          children: <Widget>[
            SingleChildScrollView(child: RegularExample()),
            SingleChildScrollView(child: ColumnExample()),
            SingleChildScrollView(child: ListExample()),
          ],
        ),
      ),
    );
  }
}
