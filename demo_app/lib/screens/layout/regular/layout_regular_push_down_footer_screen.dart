import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/screens/layout/views/push_down_footer_view.dart';

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
    return const YgLayoutRegular(
      appBar: YgAppBar2(),
      child: PushDownFooterView(),
    );
  }
}
