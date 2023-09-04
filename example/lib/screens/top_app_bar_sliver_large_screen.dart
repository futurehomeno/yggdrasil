import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class TopAppBarSliverLargeScreen extends StatefulWidget {
  const TopAppBarSliverLargeScreen({super.key});

  static const String routeName = 'TopAppBarSliverLargeScreen';

  static PageRouteBuilder<Widget> route() {
    return const YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const TopAppBarSliverLargeScreen(),
    );
  }

  @override
  State<TopAppBarSliverLargeScreen> createState() => _TopAppBarSliverLargeScreenState();
}

class _TopAppBarSliverLargeScreenState extends State<TopAppBarSliverLargeScreen> {
  @override
  Widget build(BuildContext context) {
    return DemoScreen(
      componentName: 'TopAppBarSliverLarge',
      componentDesc: 'TopAppBarSliverLarge',
      supernovaLink: 'Link',
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: const CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: YgListTile(title: 'Large sliver top app bar (title only)'),
            ),
            YgSliverTopAppBar(
              automaticallyImplyLeading: false,
              title: 'Page title',
              variant: YgSliverTopAppBarVariant.large,
            ),
            SliverToBoxAdapter(
              child: YgListTile(title: 'Large sliver top app bar (title and leading)'),
            ),
            YgSliverTopAppBar(
              leading: YgIcon(YgIcons.caretLeft),
              title: 'Page title',
              variant: YgSliverTopAppBarVariant.large,
            ),
            SliverToBoxAdapter(
              child: YgListTile(title: 'Large sliver top app bar (title and actions)'),
            ),
            YgSliverTopAppBar(
              actions: <Widget>[
                YgIcon(YgIcons.alert),
                SizedBox(width: 10.0),
              ],
              automaticallyImplyLeading: false,
              title: 'Page title',
              variant: YgSliverTopAppBarVariant.large,
            ),
            SliverToBoxAdapter(
              child: YgListTile(title: 'Large sliver top app bar (title, leading and actions)'),
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
              centerTitle: false,
              leading: YgIcon(YgIcons.caretLeft),
              title: 'Page title',
              variant: YgSliverTopAppBarVariant.large,
            ),
            // Used for better scrolling preview.
            SliverToBoxAdapter(
              child: SizedBox(
                height: 1000.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
