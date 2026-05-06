import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/screens/layout/demo_views/pull_to_refresh_view.dart';
import 'package:yggdrasil_demo/widgets/demo_screen/demo_app_bar.dart';

class LayoutRegularPullToRefreshScreen extends StatelessWidget {
  const LayoutRegularPullToRefreshScreen({super.key});

  static const String routeName = 'LayoutRegularPullToRefreshScreen';

  static PageRouteBuilder<Widget> route() {
    return const YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const LayoutRegularPullToRefreshScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const YgLayout(
      appBar: DemoAppBar(
        title: 'Pull to refresh',
      ),
      child: PullToRefreshView(),
    );
  }
}
