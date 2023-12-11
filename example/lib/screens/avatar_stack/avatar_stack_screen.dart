import 'dart:math';

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
        children: <Widget>[
          ...List<Widget>.generate(
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
          YgSection(
            title: 'An AvatarStack more than 6 entries',
            child: Center(
              child: YgAvatarStack(
                entries: _getEntries(10),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<YgAvatarStackEntry> _getEntries(int count) {
    final List<YgAvatarStackEntry> entries = <YgAvatarStackEntry>[];
    final Random random = Random(count);
    final List<String> avatars = <String>[
      'assets/images/example_avatar_0.png',
      'assets/images/example_avatar_1.png',
      'assets/images/example_avatar_2.png',
      'assets/images/example_avatar_3.png',
      'assets/images/example_avatar_4.png',
      'assets/images/example_avatar_5.png',
    ];

    for (int i = 0; i < count; i++) {
      if (avatars.isEmpty) {
        entries.add(const YgAvatarStackEntry(
          name: 'Person',
        ));
      }

      entries.add(YgAvatarStackEntry(
        name: 'Person',
        image: Image.asset(
          avatars.removeAt(random.nextInt(avatars.length)),
          semanticLabel: 'example_avatar',
        ),
      ));
    }

    return entries;
  }
}
