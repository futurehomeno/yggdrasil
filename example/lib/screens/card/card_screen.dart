import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({super.key});

  static const String routeName = 'CardScreen';

  static PageRouteBuilder<Widget> route() {
    return const YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const CardScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DemoScreen(
      componentName: 'Card',
      child: Column(
        children: <Widget>[
          YgSection.column(
            title: 'Variants',
            subtitle: 'Spacing between cards added manually.',
            children: <Widget>[
              const YgCard(
                child: YgListTile(
                  title: 'Elevated card',
                  subtitle: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                ),
              ),
              const YgCard(
                variant: YgCardVariant.filled,
                child: YgListTile(
                  title: 'Filled card',
                  subtitle: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                ),
              ),
              const YgCard(
                variant: YgCardVariant.outlined,
                child: YgListTile(
                  title: 'Outlined card',
                  subtitle: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                ),
              ),
            ].withVerticalSpacing(10.0),
          ),
          YgSection(
            title: 'Content',
            subtitle:
                'Cards are only containers for other widgets and thus do not have any styling of their own. Most commonly you\'ll be adding a ListTile inside of them, as seen in the examples here.',
            child: YgCard(
              variant: YgCardVariant.filled,
              child: YgListTile(
                title: 'This is a clickable list tile',
                subtitle: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                onTap: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
