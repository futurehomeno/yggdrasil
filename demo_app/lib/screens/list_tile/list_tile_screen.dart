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
      child: YgSection.list(
        children: <YgListTile>[
          const YgListTile(
            title: 'Title only',
          ),
          const YgListTile(
            subtitle: 'Subtitle only',
          ),
          const YgListTile(
            title: 'Title and subtitle',
            subtitle: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
          ),
          const YgListTile(
            title: 'Dense list tile',
            subtitle: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
            density: YgListTileDensity.dense,
          ),
          const YgListTile(
            title: 'YgListTile with a really long title. Like, really long. Super long if you will.',
            subtitle:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus vestibulum fringilla ultrices. Pellentesque vitae sapien sed augue elementum sagittis vel sed dui.',
          ),
          const YgListTile(
            title: 'List tile with leading widget',
            subtitle: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
            leadingWidgets: <Widget>[
              YgIcon(YgIcons.info, size: YgIconSize.large),
            ],
          ),
          const YgListTile(
            leadingWidgets: <Widget>[
              YgIcon(YgIcons.info, size: YgIconSize.large),
              YgTag(
                child: Text('Leading widgets only'),
              ),
            ],
          ),
          const YgListTile(
            title: 'Leading and trailing widgets',
            subtitle: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
            leadingWidgets: <Widget>[
              YgIcon(YgIcons.info, size: YgIconSize.large),
            ],
            trailingWidgets: <Widget>[
              YgIcon(YgIcons.info, size: YgIconSize.large),
            ],
          ),
          const YgListTile(
            title: 'Leading, trailing and supporting widgets',
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
            title: 'Multiple supporting widgets',
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
            title: 'With info button',
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
            title: 'With subtitle icon',
            subtitle: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
            subtitleIcon: const YgIcon(YgIcons.info, size: YgIconSize.small),
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
        ],
      ),
    );
  }
}
