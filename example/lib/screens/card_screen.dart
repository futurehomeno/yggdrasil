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
    return const YgScreen(
      componentName: 'Card',
      componentDesc: 'Cards',
      supernovaLink: 'Link',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          YgCard(
            child: ListTile(
              title: Text('Elevated Card'),
              subtitle: Text('With a subtitle'),
              trailing: Icon(Icons.more_vert),
            ),
          ),
          YgCard(
            variant: YgCardVariant.filled,
            child: ListTile(
              title: Text('Filled Card'),
              subtitle: Text('With a subtitle'),
              trailing: Icon(Icons.more_vert),
            ),
          ),
          YgCard(
            variant: YgCardVariant.outlined,
            child: ListTile(
              title: Text('Outlined Card'),
              subtitle: Text('With a subtitle'),
              trailing: Icon(Icons.more_vert),
            ),
          ),
        ],
      ),
    );
  }
}
