import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/screens/layout/views/sliver_view.dart';

class LayoutRegularSliverScreen extends StatelessWidget {
  const LayoutRegularSliverScreen({super.key});

  static const String routeName = 'LayoutRegularSliverScreen';

  static PageRouteBuilder<Widget> route() {
    return const YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const LayoutRegularSliverScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const YgLayoutRegular(
      appBar: YgAppBar2(),
      child: SliverView(),
    );
  }
}
