import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/screens/layout/views/centered_view.dart';

class LayoutRegularCenteredScreen extends StatelessWidget {
  const LayoutRegularCenteredScreen({super.key});

  static const String routeName = 'LayoutRegularCenteredScreen';

  static PageRouteBuilder<Widget> route() {
    return const YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const LayoutRegularCenteredScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return YgLayoutRegular(
      appBar: SafeArea(
        bottom: false,
        child: Container(
          color: Colors.green,
          height: 64,
          alignment: Alignment.center,
          child: const Text(
            'AppBar',
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
      child: const CenteredView(),
    );
  }
}
