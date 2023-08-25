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
      componentDesc: 'Badges',
      supernovaLink: 'Link',
      child: Column(
        children: <Widget>[
          YgSection.column(
            title: 'Badges with count 0 - 9',
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  YgBadge(
                    amount: 0,
                    weight: YgBadgeWeight.strong,
                    child: YgIconButton(
                      onPressed: () {},
                      child: const YgIcon(YgIcons.info),
                    ),
                  ),
                  YgBadge(
                    amount: 1,
                    weight: YgBadgeWeight.strong,
                    child: YgIconButton(
                      onPressed: () {},
                      child: const YgIcon(YgIcons.info),
                    ),
                  ),
                  YgBadge(
                    amount: 8,
                    weight: YgBadgeWeight.strong,
                    child: YgIconButton(
                      onPressed: () {},
                      child: const YgIcon(YgIcons.info),
                    ),
                  ),
                  YgBadge(
                    amount: 9,
                    weight: YgBadgeWeight.strong,
                    child: YgIconButton(
                      onPressed: () {},
                      child: const YgIcon(YgIcons.info),
                    ),
                  ),
                ],
              ),
            ],
          ),
          YgSection.column(
            title: 'Badge with more than 9',
            children: <Widget>[
              YgBadge(
                amount: 10,
                weight: YgBadgeWeight.weak,
                child: YgIconButton(
                  onPressed: () {},
                  child: const YgIcon(YgIcons.info),
                ),
              ),
            ],
          ),
          const YgSection.column(
            title: 'Dot badge',
            children: <Widget>[
              YgDotBadge(),
            ],
          ),
        ],
      ),
    );
  }
}
