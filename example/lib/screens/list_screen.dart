import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/extensions/widget_extensions.dart';
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
    return YgScreen(
      componentName: 'List',
      componentDesc: 'Lists',
      supernovaLink: 'Link',
      child: Column(
        children: <Widget>[
          const YgListTile(title: 'ListView.builder'),
          ListView.builder(
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (BuildContext context, int index) {
              return YgListTile(title: 'Title $index');
            },
          ).inspectable,
          const YgListTile(title: 'ListView.separated'),
          ListView.separated(
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (BuildContext context, int index) {
              return YgListTile(title: 'Title $index');
            },
            separatorBuilder: (BuildContext context, int index) {
              return const YgDivider();
            },
          ).inspectable,
          const YgListTile(title: 'ListView w/ separated by'),
          ListView(
            shrinkWrap: true,
            children: <YgListTile>[
              const YgListTile(title: 'Title 1'),
              const YgListTile(title: 'Title 1'),
              const YgListTile(title: 'Title 1')
            ].separatedBy(const YgDivider()),
          ).inspectable,
          const YgListTile(title: 'Manual'),
          ListView(
            shrinkWrap: true,
            children: const <Widget>[
              YgListTile(title: 'Title 1'),
              YgDivider(),
              YgListTile(title: 'Title 1'),
              YgDivider(),
              YgListTile(title: 'Title 1')
            ],
          ).inspectable,
        ],
      ),
    );
  }
}
