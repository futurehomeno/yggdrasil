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
    final List<int> amounts = <int>[1, 2, 3, 4, 5, 6, 14, 15];

    return DemoScreen(
      componentName: 'AvatarStack',
      child: Column(
        children: <Widget>[
          ...amounts.map(
            (int amount) => YgSection(
              title: 'An AvatarStack with $amount entries',
              child: YgAvatarStack(
                entries: _getEntries(amount),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<YgAvatarStackEntry> _getEntries(int count) {
    final List<YgAvatarStackEntry> entries = <YgAvatarStackEntry>[];
    final Random random = Random(count + 1);
    final List<String> avatars = <String>[
      'assets/images/example_avatar_0.webp',
      'assets/images/example_avatar_1.webp',
      'assets/images/example_avatar_2.webp',
      'assets/images/example_avatar_3.webp',
      'assets/images/example_avatar_4.webp',
      'assets/images/example_avatar_5.webp',
    ];

    for (int i = 0; i < count; i++) {
      final String initials = String.fromCharCode(65 + (i % 26));

      if (avatars.isEmpty) {
        entries.add(
          YgAvatarStackEntry(
            initials: initials,
          ),
        );

        continue;
      }

      entries.add(YgAvatarStackEntry(
        initials: initials,
        image: Image.asset(
          avatars.removeAt(avatars.length == 1 ? 0 : random.nextInt(avatars.length)),
          semanticLabel: 'example_avatar',
        ),
      ));
    }

    return entries;
  }
}
