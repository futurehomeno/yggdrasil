import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({super.key});

  static const String routeName = 'CardScreen';

  static PageRouteBuilder<Widget> route() {
    return YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const CardScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return YgScreen(
      componentName: 'Card',
      componentDesc: 'Cards',
      supernovaLink: 'Link',
      child: Column(
        children: <Widget>[
          const YgListTile(title: 'Elevated card'),
          Column(children: <Widget>[
            const YgCard(
              child: YgListTile(
                title: 'Elevated card',
                subtitle: 'Bacon ipsum dolor amet chicken frankfurter burgdoggen landjaeger sirloin ham pig.',
              ),
            ),
            YgCard(
              child: YgListTile(
                title: 'Elevated card w/ tapable tile',
                subtitle: 'Bacon ipsum dolor amet chicken frankfurter burgdoggen landjaeger sirloin ham pig.',
                onTap: () {},
              ),
            ),
          ]),
          const YgListTile(title: 'Filled card'),
          Column(children: <Widget>[
            const YgCard(
              variant: YgCardVariant.filled,
              child: YgListTile(
                title: 'Filled card',
                subtitle: 'Bacon ipsum dolor amet chicken frankfurter burgdoggen landjaeger sirloin ham pig.',
              ),
            ),
            YgCard(
              variant: YgCardVariant.filled,
              child: YgListTile(
                title: 'Filled card w/ tapable tile',
                subtitle: 'Bacon ipsum dolor amet chicken frankfurter burgdoggen landjaeger sirloin ham pig.',
                onTap: () {},
              ),
            ),
          ]),
          const YgListTile(title: 'Outlined card'),
          Column(children: <Widget>[
            const YgCard(
              variant: YgCardVariant.outlined,
              child: YgListTile(
                title: 'Outlined card',
                subtitle: 'Bacon ipsum dolor amet chicken frankfurter burgdoggen landjaeger sirloin ham pig.',
              ),
            ),
            YgCard(
              variant: YgCardVariant.outlined,
              child: YgListTile(
                title: 'Outlined card w/ tapable tile',
                subtitle: 'Bacon ipsum dolor amet chicken frankfurter burgdoggen landjaeger sirloin ham pig.',
                onTap: () {},
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
