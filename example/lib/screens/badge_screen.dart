import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class BadgeScreen extends StatelessWidget {
  const BadgeScreen({super.key});

  static const String routeName = 'BadgeScreen';

  static PageRouteBuilder<Widget> route() {
    return YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const BadgeScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return YgScreen(
      componentName: 'Badge',
      componentDesc: 'Badges',
      supernovaLink: 'Link',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          YgBadge(
            amount: 5,
            weight: YgBadgeWeight.strong,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications_none_outlined),
            ),
          ),
          YgBadge(
            amount: 18,
            weight: YgBadgeWeight.weak,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications_none_outlined),
            ),
          ),
          const YgDotBadge(),
        ],
      ),
    );
  }
}
