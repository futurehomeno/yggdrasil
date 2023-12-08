import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class AvatarStackScreen extends StatelessWidget {
  const AvatarStackScreen({super.key});

  static const String routeName = 'AvatarStackScreen';

  static PageRouteBuilder<Widget> route() {
    return const YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const AvatarStackScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DemoScreen(
      componentName: 'AvatarStack',
      child: Column(
        children: List.generate(
          5,
          (int index) => YgSection(
            title: 'An AvatarStack with ${index + 2} entries',
            child: Center(
              child: YgAvatarStack(
                entries: _getEntries(index + 2),
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<YgAvatarStackEntry> _getEntries(int count) {
    return List<YgAvatarStackEntry>.generate(
      count,
      (int index) {
        return const YgAvatarStackEntry(
          name: 'Person',
        );
      },
    );
  }
}
