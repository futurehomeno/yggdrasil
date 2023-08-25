import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class DividerScreen extends StatelessWidget {
  const DividerScreen({super.key});

  static const String routeName = 'DividerScreen';

  static PageRouteBuilder<Widget> route() {
    return const YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const DividerScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const DemoScreen(
      componentName: 'Divider',
      componentDesc: 'Dividers',
      supernovaLink: 'Link',
      child: Column(
        children: <Widget>[
          YgSection.column(
            title: 'Normal Divider',
            children: <Widget>[
              YgDivider(),
            ],
          ),
          YgSection.column(
            title: 'Divider /w start indent',
            children: <Widget>[
              YgDivider(indent: YgDividerIndent.large),
            ],
          ),
          YgSection.column(
            title: 'Divider w/ end indent',
            children: <Widget>[
              YgDivider(endIndent: YgDividerIndent.large),
            ],
          ),
          YgSection.column(
            title: 'Divider w/ both indent',
            children: <Widget>[
              YgDivider(
                indent: YgDividerIndent.large,
                endIndent: YgDividerIndent.large,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
