import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/screens/layout/demo_views/centered_view.dart';
import 'package:yggdrasil_demo/screens/layout/demo_views/scrollable_view.dart';
import 'package:yggdrasil_demo/screens/layout/demo_views/sliver_view.dart';
import 'package:yggdrasil_demo/widgets/demo_screen/demo_app_bar.dart';

class LayoutTabbedScreen extends StatelessWidget {
  const LayoutTabbedScreen({super.key});

  static const String routeName = 'LayoutTabbedScreen';

  static PageRouteBuilder<Widget> route() {
    return const YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const LayoutTabbedScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return YgLayout.tabbed(
      initialTab: 2,
      onTabChanged: (int value) => print('onTabChanged: $value'),
      onTabVisible: (int value) => print('onTabVisible: $value'),
      headerBehavior: YgHeaderBehavior.hideAppBar,
      tabs: const <YgLayoutTab>[
        YgLayoutTab(
          title: 'Scrollable',
          content: ScrollableView(),
        ),
        YgLayoutTab(
          title: 'Sliver',
          content: SliverView(),
        ),
        YgLayoutTab(
          title: 'Centered',
          content: CenteredView(),
        ),
        // YgLayoutTab(
        //   title: 'Sticky',
        //   content: StickyFooterView(),
        // ),
        // YgLayoutTab(
        //   title: 'PushDown',
        //   content: PushDownFooterView(),
        // ),
      ],
      appBar: const DemoAppBar(
        title: 'Layout tabbed',
      ),
    );
  }
}
