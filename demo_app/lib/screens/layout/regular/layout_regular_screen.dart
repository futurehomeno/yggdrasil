import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/screens/layout/demo_views/default_view.dart';
import 'package:yggdrasil_demo/widgets/demo_screen/demo_app_bar.dart';

class LayoutRegularScreen extends StatelessWidget {
  const LayoutRegularScreen({super.key});

  static const String routeName = 'LayoutRegularScreen';

  static PageRouteBuilder<Widget> route() {
    return const YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const LayoutRegularScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const YgLayout(
      appBar: DemoAppBar(
        title: 'Regular layout',
      ),
      child: DefaultView(),
    );
  }
}
