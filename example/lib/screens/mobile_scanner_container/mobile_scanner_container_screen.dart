import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class MobileScannerContainerScreen extends StatelessWidget {
  const MobileScannerContainerScreen({super.key});

  static const String routeName = 'MobileScannerContainerScreen';

  static PageRouteBuilder<Widget> route() {
    return const YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const MobileScannerContainerScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const DemoScreen(
      componentName: 'MobileScannerContainer',
      child: Column(
        children: <Widget>[
          YgSection(
            title: 'Mobile scanner container',
            subtitle: 'Using placeholder as child to show the size of the mobile scanner.',
            child: YgMobileScannerContainer(
              child: DemoPlaceholder(),
            ),
          ),
        ],
      ),
    );
  }
}
