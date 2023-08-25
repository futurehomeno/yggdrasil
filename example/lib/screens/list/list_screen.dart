import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

// TODO(bjhandeland): Add list example with lazy loading.
class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  static const String routeName = 'ListScreen';

  static PageRouteBuilder<Widget> route() {
    return YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const ListScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DemoScreen(
      componentName: 'List',
      componentDesc: 'Lists',
      supernovaLink: 'Link',
      scrollable: false,
      child: YgSection.base(
        child: YgCallout(
          title: 'Nothing here yet.',
          description: 'Best practices for how to make lists with slivers are a work in progress.',
        ),
      ),
    );
  }
}
