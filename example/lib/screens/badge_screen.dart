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
        children: <Widget>[
          const YgListTile(title: 'Badges with count 0 - 9'),
          YgBadge(
            amount: 0,
            weight: YgBadgeWeight.strong,
            child: YgIcon(
              onTap: () {},
              YgIcons.info,
              tapSize: YgIconTapSize.largest,
            ),
          ).inspectable,
          YgBadge(
            amount: 1,
            weight: YgBadgeWeight.strong,
            child: YgIcon(
              onTap: () {},
              YgIcons.info,
              tapSize: YgIconTapSize.largest,
            ),
          ).inspectable,
          YgBadge(
            amount: 8,
            weight: YgBadgeWeight.strong,
            child: YgIcon(
              onTap: () {},
              YgIcons.info,
              tapSize: YgIconTapSize.largest,
            ),
          ).inspectable,
          YgBadge(
            amount: 9,
            weight: YgBadgeWeight.strong,
            child: YgIcon(
              onTap: () {},
              YgIcons.info,
              tapSize: YgIconTapSize.largest,
            ),
          ).inspectable,
          const YgListTile(title: 'Badges with more than 9'),
          YgBadge(
            amount: 10,
            weight: YgBadgeWeight.weak,
            child: YgIcon(
              onTap: () {},
              YgIcons.info,
              tapSize: YgIconTapSize.largest,
            ),
          ).inspectable,
          const YgListTile(title: 'Dot badge'),
          const YgDotBadge().inspectable,
        ],
      ),
    );
  }
}
