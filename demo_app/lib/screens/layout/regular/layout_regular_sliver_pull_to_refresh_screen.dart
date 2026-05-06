import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/screens/layout/demo_views/sliver_pull_to_refresh_view.dart';
import 'package:yggdrasil_demo/widgets/demo_screen/demo_app_bar.dart';

class LayoutRegularSliverPullToRefreshScreen extends StatelessWidget {
  const LayoutRegularSliverPullToRefreshScreen({super.key});

  static const String routeName = 'LayoutRegularSliverPullToRefreshScreen';

  static PageRouteBuilder<Widget> route() {
    return const YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const LayoutRegularSliverPullToRefreshScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const YgLayout(
      headerBehavior: YgHeaderBehavior.hideAppBar,
      appBar: DemoAppBar(
        title: 'Sliver pull to refresh',
      ),
      child: SliverPullToRefreshView(),
    );
  }
}
