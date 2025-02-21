import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/screens/layout/demo_views/push_down_footer_view.dart';
import 'package:yggdrasil_demo/widgets/demo_screen/demo_app_bar.dart';

class LayoutRegularPushDownFooterScreen extends StatelessWidget {
  const LayoutRegularPushDownFooterScreen({super.key});

  static const String routeName = 'LayoutRegularPushDownFooterScreen';

  static PageRouteBuilder<Widget> route() {
    return const YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const LayoutRegularPushDownFooterScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const YgLayout(
      appBar: DemoAppBar(
        title: 'YgFooterBehavior.pushDown',
      ),
      child: PushDownFooterView(),
    );
  }
}
