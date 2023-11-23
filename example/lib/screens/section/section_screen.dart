import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

import 'examples/_examples.dart';

class SectionScreen extends StatelessWidget {
  const SectionScreen({super.key});

  static const String routeName = 'SectionScreen';

  static PageRouteBuilder<Widget> route() {
    return const YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const SectionScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 3,
      child: DemoScreen(
        componentName: 'Section',
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
