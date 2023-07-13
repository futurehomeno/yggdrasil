import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

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
          YgListTile(title: 'ListView.builder'),
          ListView.builder(
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (BuildContext context, int index) {
              return YgListTile(title: 'Title $index');
            },
          ),
          YgListTile(title: 'ListView.separated'),
          ListView.separated(
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (BuildContext context, int index) {
              return YgListTile(title: 'Title $index');
            },
            separatorBuilder: (BuildContext context, int index) {
              return const YgDivider();
            },
          ),
          YgListTile(title: 'ListView w/ divideTiles'),
          ListView(
            shrinkWrap: true,
            children: YgListTile.divideTiles(
              tiles: <YgListTile>[
                YgListTile(title: 'Title 1'),
                YgListTile(title: 'Title 1'),
                YgListTile(title: 'Title 1')
              ],
              context: context,
            ).toList(),
          ),
          YgListTile(title: 'Manual'),
          ListView(
            shrinkWrap: true,
            children: <Widget>[
              YgListTile(title: 'Title 1'),
              const YgDivider(),
              YgListTile(title: 'Title 1'),
              const YgDivider(),
              YgListTile(title: 'Title 1')
            ],
          ),
          // TODO(bjhandeland): Add list example with lazy loading.
        ],
      ),
    );
  }
}
