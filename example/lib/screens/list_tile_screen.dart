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
              YgIcon(SharedIcons.other25, size: YgIconSize.large),
            ],
          ),
          YgListTile(
            title: 'Title',
            subtitle: 'Bacon ipsum dolor amet chicken frankfurter burgdoggen landjaeger sirloin ham pig.',
            leadingWidgets: const <Widget>[
              YgIcon(SharedIcons.other25, size: YgIconSize.large),
            ],
            trailingWidgets: const <Widget>[
              YgIcon(SharedIcons.other25, size: YgIconSize.large),
            ],
          ),
          YgListTile(
            title: 'Title',
            subtitle: 'Bacon ipsum dolor amet chicken frankfurter burgdoggen landjaeger sirloin ham pig.',
            leadingWidgets: const <Widget>[
              YgIcon(SharedIcons.other25, size: YgIconSize.large),
            ],
            trailingWidgets: const <Widget>[
              YgIcon(SharedIcons.other25, size: YgIconSize.large),
            ],
            supportingWidgets: const <Widget>[
              YgIcon(SharedIcons.other25, size: YgIconSize.large),
            ],
          ),
          YgListTile(
            title: 'Title',
            subtitle: 'Bacon ipsum dolor amet chicken frankfurter burgdoggen landjaeger sirloin ham pig.',
            leadingWidgets: const <Widget>[
              YgIcon(SharedIcons.other25, size: YgIconSize.large),
            ],
            trailingWidgets: const <Widget>[
              YgIcon(SharedIcons.other25, size: YgIconSize.large),
            ],
            supportingWidgets: const <Widget>[
              YgIcon(SharedIcons.other25, size: YgIconSize.large),
              YgIcon(SharedIcons.other25, size: YgIconSize.large),
            ],
          ),
          YgListTile(
            title: 'Title',
            subtitle: 'Bacon ipsum dolor amet chicken frankfurter burgdoggen landjaeger sirloin ham pig.',
            onInfoTap: () {},
            leadingWidgets: const <Widget>[
              YgIcon(SharedIcons.other25, size: YgIconSize.large),
            ],
            trailingWidgets: const <Widget>[
              YgIcon(SharedIcons.other25, size: YgIconSize.large),
            ],
            supportingWidgets: const <Widget>[
              YgIcon(SharedIcons.other25, size: YgIconSize.large),
              YgIcon(SharedIcons.other25, size: YgIconSize.large),
            ],
          ),
          YgListTile(
            title: 'Tappable!',
            subtitle: 'Bacon ipsum dolor amet chicken frankfurter burgdoggen landjaeger sirloin ham pig.',
            onTap: () {},
            onInfoTap: () {},
            leadingWidgets: const <Widget>[
              YgIcon(SharedIcons.other25, size: YgIconSize.large),
            ],
            trailingWidgets: const <Widget>[
              YgIcon(SharedIcons.other25, size: YgIconSize.large),
            ],
            supportingWidgets: const <Widget>[
              YgIcon(SharedIcons.other25, size: YgIconSize.large),
              YgIcon(SharedIcons.other25, size: YgIconSize.large),
            ],
          ),
          YgListTile(
            title: 'Tappable!',
            subtitle: 'Bacon ipsum dolor amet chicken frankfurter burgdoggen landjaeger sirloin ham pig.',
            subtitleIcon: const YgIcon(SharedIcons.other25, size: YgIconSize.small),
            onTap: () {},
            onInfoTap: () {},
            leadingWidgets: const <Widget>[
              YgIcon(SharedIcons.other25, size: YgIconSize.large),
            ],
            trailingWidgets: const <Widget>[
              YgIcon(SharedIcons.other25, size: YgIconSize.large),
            ],
            supportingWidgets: const <Widget>[
              YgIcon(SharedIcons.other25, size: YgIconSize.large),
              YgIcon(SharedIcons.other25, size: YgIconSize.large),
            ],
          ),
        ],
      ),
    );
  }
}
