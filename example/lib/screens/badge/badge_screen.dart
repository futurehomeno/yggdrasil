import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class BadgeScreen extends StatelessWidget {
  const BadgeScreen({super.key});

  static const String routeName = 'BadgeScreen';

  static PageRouteBuilder<Widget> route() {
    return const YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const BadgeScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DemoScreen(
      componentName: 'Badge',
      child: Column(
        children: <Widget>[
          YgSection(
            title: 'Badges with count 0 - 9',
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                YgBadge(
                  amount: 0,
                  weight: YgBadgeWeight.strong,
                  child: YgIconButton(
                    onPressed: () {},
                    icon: YgIcons.info,
                  ),
                ),
                YgBadge(
                  amount: 1,
                  weight: YgBadgeWeight.strong,
                  child: YgIconButton(
                    onPressed: () {},
                    icon: YgIcons.info,
                  ),
                ),
                YgBadge(
                  amount: 8,
                  weight: YgBadgeWeight.strong,
                  child: YgIconButton(
                    onPressed: () {},
                    icon: YgIcons.info,
                  ),
                ),
                YgBadge(
                  amount: 9,
                  weight: YgBadgeWeight.strong,
                  child: YgIconButton(
                    onPressed: () {},
                    icon: YgIcons.info,
                  ),
                ),
              ],
            ),
          ),
          YgSection(
            title: 'Badge with more than 9',
            child: YgBadge(
              amount: 10,
              weight: YgBadgeWeight.weak,
              child: YgIconButton(
                onPressed: () {},
                icon: YgIcons.info,
              ),
            ),
          ),
          const YgSection(
            title: 'Dot badge',
            child: YgDotBadge(),
          ),
        ],
      ),
    );
  }
}
