import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class TopAppBarSliverSmallScreen extends StatefulWidget {
  const TopAppBarSliverSmallScreen({super.key});

  static const String routeName = 'TopAppBarSliverSmallScreen';

  static PageRouteBuilder<Widget> route() {
    return const YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const TopAppBarSliverSmallScreen(),
    );
  }

  @override
  State<TopAppBarSliverSmallScreen> createState() => _TopAppBarSliverSmallScreenState();
}

class _TopAppBarSliverSmallScreenState extends State<TopAppBarSliverSmallScreen> {
  @override
  Widget build(BuildContext context) {
    return DemoScreen(
      componentName: 'TopAppBarSliverSmall',
      componentDesc: 'TopAppBarSliverSmall',
      supernovaLink: 'Link',
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: const CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: YgListTile(title: 'Small-centered sliver top app bar (title only)'),
            ),
            YgSliverTopAppBar(
              automaticallyImplyLeading: false,
              title: 'Page title',
              centerTitle: true,
              variant: YgSliverTopAppBarVariant.small,
            ),
            SliverToBoxAdapter(
              child: YgListTile(title: 'Small-centered sliver top app bar (title and leading)'),
            ),
            YgSliverTopAppBar(
              leading: YgIcon(YgIcons.caretLeft),
              title: 'Page title',
              centerTitle: true,
              variant: YgSliverTopAppBarVariant.small,
            ),
            SliverToBoxAdapter(
              child: YgListTile(title: 'Small-centered sliver top app bar (title and actions)'),
            ),
            YgSliverTopAppBar(
              actions: <Widget>[
                YgIcon(YgIcons.alert),
                SizedBox(width: 10.0),
              ],
              automaticallyImplyLeading: false,
              title: 'Page title',
              centerTitle: true,
              variant: YgSliverTopAppBarVariant.small,
            ),
            SliverToBoxAdapter(
              child: YgListTile(title: 'Small-centered sliver top app bar (title, leading and actions)'),
            ),
            YgSliverTopAppBar(
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
              variant: YgSliverTopAppBarVariant.small,
            ),
            SliverToBoxAdapter(
              child: YgListTile(title: 'Small sliver top app bar (title only)'),
            ),
            YgSliverTopAppBar(
              automaticallyImplyLeading: false,
              title: 'Page title',
              variant: YgSliverTopAppBarVariant.small,
            ),
            SliverToBoxAdapter(
              child: YgListTile(title: 'Small sliver top app bar (title and leading)'),
            ),
            YgSliverTopAppBar(
              leading: YgIcon(YgIcons.caretLeft),
              title: 'Page title',
              variant: YgSliverTopAppBarVariant.small,
            ),
            SliverToBoxAdapter(
              child: YgListTile(title: 'Small sliver top app bar (title and actions)'),
            ),
            YgSliverTopAppBar(
              actions: <Widget>[
                YgIcon(YgIcons.alert),
                SizedBox(width: 10.0),
              ],
              automaticallyImplyLeading: false,
              title: 'Page title',
              variant: YgSliverTopAppBarVariant.small,
            ),
            SliverToBoxAdapter(
              child: YgListTile(title: 'Small sliver top app bar (title, leading and actions)'),
            ),
            YgSliverTopAppBar(
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
              variant: YgSliverTopAppBarVariant.small,
            ),
            // Used for better scrolling preview.
            SliverToBoxAdapter(
              child: SizedBox(height: 1000.0),
            ),
          ],
        ),
      ),
    );
  }
}
