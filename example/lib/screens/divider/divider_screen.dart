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
          YgSection.base(
            title: 'Normal Divider',
            child: YgDivider(),
          ),
          YgSection.base(
            title: 'Divider /w start indent',
            child: YgDivider(indent: YgDividerIndent.large),
          ),
          YgSection.base(
            title: 'Divider w/ end indent',
            child: YgDivider(endIndent: YgDividerIndent.large),
          ),
          YgSection.base(
            title: 'Divider w/ both indent',
            child: YgDivider(
              indent: YgDividerIndent.large,
              endIndent: YgDividerIndent.large,
            ),
          ),
        ],
      ),
    );
  }
}
