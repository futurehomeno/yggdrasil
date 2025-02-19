import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/screens/layout/views/scrollable_view.dart';
import 'package:yggdrasil_demo/widgets/demo_screen/demo_app_bar.dart';

class LayoutRegularScrollableScreen extends StatelessWidget {
  const LayoutRegularScrollableScreen({super.key});

  static const String routeName = 'LayoutRegularScrollableScreen';

  static PageRouteBuilder<Widget> route() {
    return const YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const LayoutRegularScrollableScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const YgLayout(
      appBar: DemoAppBar(
        title: 'Scrollable layout',
      ),
      child: ScrollableView(),
    );
  }
}
