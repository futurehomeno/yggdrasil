import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class ListTileScreen extends StatelessWidget {
  const ListTileScreen({super.key});

  static const String routeName = 'ListTileScreen';

  static PageRouteBuilder<Widget> route() {
    return const YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const ListTileScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DemoScreen(
      componentName: 'ListTile',
      componentDesc: 'List Tiles',
      supernovaLink: 'Link',
      child: YgSection.list(
        children: <Widget>[
          const YgListTile(
            title: 'Title',
          ),
          const YgListTile(
            title: 'Title',
            subtitle: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
          ),
          const YgListTile(
            title: 'YgListTile with a really long title. Like, really long. Super long if you will.',
            subtitle:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus vestibulum fringilla ultrices. Pellentesque vitae sapien sed augue elementum sagittis vel sed dui.',
          ),
          const YgListTile(
            title: 'Title',
            subtitle: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
            leadingWidgets: <Widget>[
              YgIcon(YgIcons.info, size: YgIconSize.large),
            ],
          ),
          const YgListTile(
            title: 'Title',
            subtitle: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
            leadingWidgets: <Widget>[
              YgIcon(YgIcons.info, size: YgIconSize.large),
            ],
            trailingWidgets: <Widget>[
              YgIcon(YgIcons.info, size: YgIconSize.large),
            ],
          ),
          const YgListTile(
            title: 'Title',
            subtitle: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
            leadingWidgets: <Widget>[
              YgIcon(YgIcons.info, size: YgIconSize.large),
            ],
            trailingWidgets: <Widget>[
              YgIcon(YgIcons.info, size: YgIconSize.large),
            ],
            supportingWidgets: <Widget>[
              YgIcon(YgIcons.info, size: YgIconSize.large),
            ],
          ),
          const YgListTile(
            title: 'Title',
            subtitle: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
            leadingWidgets: <Widget>[
              YgIcon(YgIcons.info, size: YgIconSize.large),
            ],
            trailingWidgets: <Widget>[
              YgIcon(YgIcons.info, size: YgIconSize.large),
            ],
            supportingWidgets: <Widget>[
              YgIcon(YgIcons.info, size: YgIconSize.large),
              YgIcon(YgIcons.info, size: YgIconSize.large),
            ],
          ),
          YgListTile(
            title: 'Title',
            subtitle: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
            onInfoTap: () {},
            leadingWidgets: const <Widget>[
              YgIcon(YgIcons.info, size: YgIconSize.large),
            ],
            trailingWidgets: const <Widget>[
              YgIcon(YgIcons.info, size: YgIconSize.large),
            ],
            supportingWidgets: const <Widget>[
              YgIcon(YgIcons.info, size: YgIconSize.large),
              YgIcon(YgIcons.info, size: YgIconSize.large),
            ],
          ),
          YgListTile(
            title: 'Tappable!',
            subtitle: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
            onTap: () {},
            onInfoTap: () {},
            leadingWidgets: const <Widget>[
              YgIcon(YgIcons.info, size: YgIconSize.large),
            ],
            trailingWidgets: const <Widget>[
              YgIcon(YgIcons.info, size: YgIconSize.large),
            ],
            supportingWidgets: const <Widget>[
              YgIcon(YgIcons.info, size: YgIconSize.large),
              YgIcon(YgIcons.info, size: YgIconSize.large),
            ],
          ),
          YgListTile(
            title: 'Tappable!',
            subtitle: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
            subtitleIcon: const YgIcon(YgIcons.info, size: YgIconSize.small),
            onTap: () {},
            onInfoTap: () {},
            leadingWidgets: const <Widget>[
              YgIcon(YgIcons.info, size: YgIconSize.large),
            ],
            trailingWidgets: const <Widget>[
              YgIcon(YgIcons.info, size: YgIconSize.large),
            ],
            supportingWidgets: const <Widget>[
              YgIcon(YgIcons.info, size: YgIconSize.large),
              YgIcon(YgIcons.info, size: YgIconSize.large),
            ],
          ),
        ],
      ),
    );
  }
}
