import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/screens/layout/views/sticky_footer_view.dart';
import 'package:yggdrasil_demo/widgets/demo_screen/demo_app_bar.dart';

class LayoutRegularStickyFooterScreen extends StatelessWidget {
  const LayoutRegularStickyFooterScreen({super.key});

  static const String routeName = 'LayoutRegularStickyFooterScreen';

  static PageRouteBuilder<Widget> route() {
    return const YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const LayoutRegularStickyFooterScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const YgLayout(
      appBar: DemoAppBar(
        title: 'YgFooterBehavior.sticky',
      ),
      child: StickyFooterView(),
    );
  }
}
