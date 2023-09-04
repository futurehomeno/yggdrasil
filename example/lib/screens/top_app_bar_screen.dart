import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

import '_screens.dart';

class TopAppBarScreen extends StatefulWidget {
  const TopAppBarScreen({super.key});

  static const String routeName = 'TopAppBarScreen';

  static PageRouteBuilder<Widget> route() {
    return const YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const TopAppBarScreen(),
    );
  }

  @override
  State<TopAppBarScreen> createState() => _TopAppBarScreenState();
}

class _TopAppBarScreenState extends State<TopAppBarScreen> {
  @override
  Widget build(BuildContext context) {
    return DemoScreen(
      componentName: 'TopAppBar',
      componentDesc: 'TopAppBar',
      supernovaLink: 'Link',
      child: Column(
        children: <Widget>[
          YgListTile(
            title: 'SliverTopAppBarSmall',
            onTap: () => sl<YgRouter>().push(TopAppBarSliverSmallScreen.route()),
            trailingWidgets: const <YgIcon>[YgIcon(YgIcons.caretRight)],
          ),
          YgListTile(
            title: 'SliverTopAppBarMedium',
            onTap: () => sl<YgRouter>().push(TopAppBarSliverMediumScreen.route()),
            trailingWidgets: const <YgIcon>[YgIcon(YgIcons.caretRight)],
          ),
          YgListTile(
            title: 'SliverTopAppBarLarge',
            onTap: () => sl<YgRouter>().push(TopAppBarSliverLargeScreen.route()),
            trailingWidgets: const <YgIcon>[YgIcon(YgIcons.caretRight)],
          ),

          const SizedBox(height: 20.0),
          const YgListTile(title: 'Default non-sliver TopAppBar (title only)'),
          const YgTopAppBar(
            automaticallyImplyLeading: false,
            title: 'Page title',
            centerTitle: true,
          ),
          const YgListTile(title: 'Default non-sliver TopAppBar (title and leading)'),
          const YgTopAppBar(
            leading: YgIcon(YgIcons.caretLeft),
            title: 'Page title',
            centerTitle: true,
          ),
          const YgListTile(title: 'Default non-sliver TopAppBar (title and actions)'),
          const YgTopAppBar(
            actions: <Widget>[
              YgIcon(YgIcons.alert),
              SizedBox(width: 10.0),
            ],
            automaticallyImplyLeading: false,
            title: 'Page title',
            centerTitle: true,
          ),
          const YgListTile(title: 'Default non-sliver TopAppBar (title, leading and actions)'),
          const YgTopAppBar(
            actions: <Widget>[
              YgIcon(YgIcons.alert),
              SizedBox(width: 10.0),
              YgIcon(YgIcons.bluetooth),
              SizedBox(width: 10.0),
              YgIcon(YgIcons.edit),
              SizedBox(width: 10.0),
            ],
            leading: YgIcon(YgIcons.caretLeft),
            title: 'Page title',
            centerTitle: true,
          ),
          // Used for better scrolling preview.
          const SizedBox(height: 500.0),
        ],
      ),
    );
  }
}
