import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class ListTileScreen extends StatelessWidget {
  const ListTileScreen({super.key});

  static const String routeName = 'ListTileScreen';

  static PageRouteBuilder<Widget> route() {
    return YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const ListTileScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return YgScreen(
      componentName: 'ListTile',
      componentDesc: 'List Tiles',
      supernovaLink: 'Link',
      child: Column(
        children: <Widget>[
          YgListTile(
            title: 'Title',
          ),
          YgListTile(
            title: 'Title',
            subtitle: 'Bacon ipsum dolor amet chicken frankfurter burgdoggen landjaeger sirloin ham pig.',
          ),
          YgListTile(
            title: 'Title',
            subtitle: 'Bacon ipsum dolor amet chicken frankfurter burgdoggen landjaeger sirloin ham pig.',
            leadingWidgets: const <Widget>[
              YgIcon(icon: 'asd', size: YgIconSize.medium),
            ],
          ),
          YgListTile(
            title: 'Title',
            subtitle: 'Bacon ipsum dolor amet chicken frankfurter burgdoggen landjaeger sirloin ham pig.',
            leadingWidgets: const <Widget>[
              YgIcon(icon: 'asd', size: YgIconSize.medium),
              YgIcon(icon: 'asd', size: YgIconSize.medium),
            ],
          ),
          YgListTile(
            title: 'Title',
            subtitle: 'Bacon ipsum dolor amet chicken frankfurter burgdoggen landjaeger sirloin ham pig.',
            leadingWidgets: const <Widget>[
              YgIcon(icon: 'asd', size: YgIconSize.medium),
              YgIcon(icon: 'asd', size: YgIconSize.medium),
            ],
            trailingWidgets: const <Widget>[
              YgIcon(icon: 'asd', size: YgIconSize.medium),
            ],
          ),
          YgListTile(
            title: 'Title',
            subtitle: 'Bacon ipsum dolor amet chicken frankfurter burgdoggen landjaeger sirloin ham pig.',
            leadingWidgets: const <Widget>[
              YgIcon(icon: 'asd', size: YgIconSize.medium),
              YgIcon(icon: 'asd', size: YgIconSize.medium),
            ],
            trailingWidgets: const <Widget>[
              YgIcon(icon: 'asd', size: YgIconSize.medium),
            ],
            supportingWidgets: const <Widget>[
              YgIcon(icon: 'asd', size: YgIconSize.medium),
            ],
          ),
          YgListTile(
            title: 'Title',
            subtitle: 'Bacon ipsum dolor amet chicken frankfurter burgdoggen landjaeger sirloin ham pig.',
            leadingWidgets: const <Widget>[
              YgIcon(icon: 'asd', size: YgIconSize.medium),
              YgIcon(icon: 'asd', size: YgIconSize.medium),
            ],
            trailingWidgets: const <Widget>[
              YgIcon(icon: 'asd', size: YgIconSize.medium),
            ],
            supportingWidgets: const <Widget>[
              YgIcon(icon: 'asd', size: YgIconSize.medium),
              YgIcon(icon: 'asd', size: YgIconSize.medium),
            ],
          ),
          YgListTile(
            title: 'Title',
            subtitle: 'Bacon ipsum dolor amet chicken frankfurter burgdoggen landjaeger sirloin ham pig.',
            onInfoTap: () {},
            leadingWidgets: const <Widget>[
              YgIcon(icon: 'asd', size: YgIconSize.medium),
              YgIcon(icon: 'asd', size: YgIconSize.medium),
            ],
            trailingWidgets: const <Widget>[
              YgIcon(icon: 'asd', size: YgIconSize.medium),
            ],
            supportingWidgets: const <Widget>[
              YgIcon(icon: 'asd', size: YgIconSize.medium),
              YgIcon(icon: 'asd', size: YgIconSize.medium),
            ],
          ),
          YgListTile(
            title: 'Tappable!',
            subtitle: 'Bacon ipsum dolor amet chicken frankfurter burgdoggen landjaeger sirloin ham pig.',
            onTap: () {},
            onInfoTap: () {},
            leadingWidgets: const <Widget>[
              YgIcon(icon: 'asd', size: YgIconSize.medium),
              YgIcon(icon: 'asd', size: YgIconSize.medium),
            ],
            trailingWidgets: const <Widget>[
              YgIcon(icon: 'asd', size: YgIconSize.medium),
              YgIcon(icon: 'asd', size: YgIconSize.medium),
            ],
            supportingWidgets: const <Widget>[
              YgIcon(icon: 'asd', size: YgIconSize.medium),
              YgIcon(icon: 'asd', size: YgIconSize.medium),
            ],
          ),
          YgListTile(
            title: 'Tappable!',
            subtitle: 'Bacon ipsum dolor amet chicken frankfurter burgdoggen landjaeger sirloin ham pig.',
            subtitleIcon: const YgIcon(icon: 'asd', size: YgIconSize.small),
            onTap: () {},
            onInfoTap: () {},
            leadingWidgets: const <Widget>[
              YgIcon(icon: 'asd', size: YgIconSize.medium),
              YgIcon(icon: 'asd', size: YgIconSize.medium),
            ],
            trailingWidgets: const <Widget>[
              YgIcon(icon: 'asd', size: YgIconSize.medium),
              YgIcon(icon: 'asd', size: YgIconSize.medium),
            ],
            supportingWidgets: const <Widget>[
              YgIcon(icon: 'asd', size: YgIconSize.medium),
              YgIcon(icon: 'asd', size: YgIconSize.medium),
            ],
          ),
        ],
      ),
    );
  }
}
