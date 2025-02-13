import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/screens/layout/views/default_view.dart';

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
    return const YgLayoutRegular(
      appBar: YgAppBar(
        title: 'Regular layout',
      ),
      child: DefaultView(),
    );
  }
}
