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
      child: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: YgSection(
              child: YgCallout(
                title: 'Making lists',
                description:
                    'These are some examples of how to correctly make lists. Please use one of these methods, or make sure that you really know what you are doing if not',
              ),
            ),
          ),
          SliverPersistentHeader(
            delegate: YgSectionTilePersistentHeaderDelegate(
              title: 'SliverPersistentHeader',
              subtitle: 'This is a SliverPersistentHeader',
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return YgListTile(title: 'Title $index');
              },
              childCount: 100,
            ),
          ),
          SliverToBoxAdapter(
            child: YgSectionTile(title: 'Separated list'),
          ),
          SliverList.separated(
            separatorBuilder: (BuildContext context, int index) {
              return const YgDivider();
            },
            itemBuilder: (BuildContext context, int index) {
              return YgListTile(title: 'Title $index');
            },
            itemCount: 3,
          ),
        ],
      ),
    );
  }
}
