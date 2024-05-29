import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class ExpandingListTileScreen extends StatelessWidget {
  const ExpandingListTileScreen({super.key});

  static const String routeName = 'ExpandingListTileScreen';

  static PageRouteBuilder<Widget> route() {
    return const YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const ExpandingListTileScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    const Widget child = DemoPlaceholder();

    return DemoScreen(
      componentName: 'ExpandingListTile',
      child: YgSection.list(
        children: <YgExpandingListTile>[
          const YgExpandingListTile(
            title: 'Title only',
            child: child,
          ),
          const YgExpandingListTile(
            subtitle: 'Subtitle only',
            child: child,
          ),
          const YgExpandingListTile(
            title: 'Title and subtitle',
            subtitle: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
            child: child,
          ),
          const YgExpandingListTile(
            title: 'Dense list tile',
            subtitle: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
            density: YgListTileDensity.dense,
            child: child,
          ),
          const YgExpandingListTile(
            title: 'YgListTile with a really long title. Like, really long. Super long if you will.',
            subtitle:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus vestibulum fringilla ultrices. Pellentesque vitae sapien sed augue elementum sagittis vel sed dui.',
            child: child,
          ),
          const YgExpandingListTile(
            title: 'List tile with leading widget',
            subtitle: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
            leadingWidgets: <Widget>[
              YgIcon(YgIcons.info, size: YgIconSize.large),
            ],
            child: child,
          ),
          const YgExpandingListTile(
            leadingWidgets: <Widget>[
              YgIcon(YgIcons.info, size: YgIconSize.large),
              YgTag(
                child: Text('Leading widgets only'),
              ),
            ],
            child: child,
          ),
          const YgExpandingListTile(
            title: 'Leading and supporting widgets',
            subtitle: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
            leadingWidgets: <Widget>[
              YgIcon(YgIcons.info, size: YgIconSize.large),
            ],
            supportingWidgets: <Widget>[
              YgIcon(YgIcons.info, size: YgIconSize.large),
            ],
            child: child,
          ),
          const YgExpandingListTile(
            title: 'Multiple supporting widgets',
            subtitle: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
            leadingWidgets: <Widget>[
              YgIcon(YgIcons.info, size: YgIconSize.large),
            ],
            supportingWidgets: <Widget>[
              YgIcon(YgIcons.info, size: YgIconSize.large),
              YgIcon(YgIcons.info, size: YgIconSize.large),
            ],
            child: child,
          ),
          YgExpandingListTile(
            title: 'With info button',
            subtitle: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
            onInfoTap: () {},
            leadingWidgets: const <Widget>[
              YgIcon(YgIcons.info, size: YgIconSize.large),
            ],
            supportingWidgets: const <Widget>[
              YgIcon(YgIcons.info, size: YgIconSize.large),
              YgIcon(YgIcons.info, size: YgIconSize.large),
            ],
            child: child,
          ),
          YgExpandingListTile(
            title: 'With subtitle icon',
            subtitle: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
            subtitleIcon: const YgIcon(YgIcons.info, size: YgIconSize.small),
            onInfoTap: () {},
            leadingWidgets: const <Widget>[
              YgIcon(YgIcons.info, size: YgIconSize.large),
            ],
            supportingWidgets: const <Widget>[
              YgIcon(YgIcons.info, size: YgIconSize.large),
              YgIcon(YgIcons.info, size: YgIconSize.large),
            ],
            child: child,
          ),
        ],
      ),
    );
  }
}
