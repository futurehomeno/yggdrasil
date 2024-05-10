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
            title: 'Title',
            child: child,
          ),
          const YgExpandingListTile(
            title: 'Title',
            subtitle: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
            child: child,
          ),
          const YgExpandingListTile(
            title: 'YgExpandingListTile with a really long title. Like, really long. Super long if you will.',
            subtitle:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus vestibulum fringilla ultrices. Pellentesque vitae sapien sed augue elementum sagittis vel sed dui.',
            child: child,
          ),
          const YgExpandingListTile(
            title: 'Title',
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
            title: 'Title',
            subtitle: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
            leadingWidgets: <Widget>[
              YgIcon(YgIcons.info, size: YgIconSize.large),
            ],
            child: child,
          ),
          const YgExpandingListTile(
            title: 'Title',
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
            title: 'Title',
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
            title: 'Title',
            subtitle: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
            onInfoTap: () {},
            leadingWidgets: const <Widget>[
              YgIcon(YgIcons.info, size: YgIconSize.large),
            ],
            child: child,
          ),
          const YgExpandingListTile(
            title: 'Title',
            subtitle: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
            subtitleIcon: YgIcon(YgIcons.info, size: YgIconSize.small),
            leadingWidgets: <Widget>[
              YgIcon(YgIcons.info, size: YgIconSize.large),
            ],
            child: child,
          ),
        ],
      ),
    );
  }
}
