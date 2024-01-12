import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class MobileScannerScreen extends StatelessWidget {
  const MobileScannerScreen({super.key});

  static const String routeName = 'MobileScannerScreen';

  static PageRouteBuilder<Widget> route() {
    return const YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const MobileScannerScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const DemoScreen(
      componentName: 'MobileScanner',
      child: Column(
        children: <Widget>[
          YgSection(
            title: 'Mobile scanner',
            subtitle: 'Using placeholder as child to show the size of the mobile scanner.',
            child: YgMobileScanner(
              child: Placeholder(),
            ),
          ),
        ],
      ),
    );
  }
}
