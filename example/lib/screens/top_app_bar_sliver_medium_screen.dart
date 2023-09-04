import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class TopAppBarSliverMediumScreen extends StatefulWidget {
  const TopAppBarSliverMediumScreen({super.key});

  static const String routeName = 'TopAppBarSliverMediumScreen';

  static PageRouteBuilder<Widget> route() {
    return const YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const TopAppBarSliverMediumScreen(),
    );
  }

  @override
  State<TopAppBarSliverMediumScreen> createState() => _TopAppBarMediumScreenState();
}

class _TopAppBarMediumScreenState extends State<TopAppBarSliverMediumScreen> {
  @override
  Widget build(BuildContext context) {
    return DemoScreen(
      componentName: 'TopAppBarSliverMedium',
      componentDesc: 'TopAppBarSliverMedium',
      supernovaLink: 'Link',
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: const CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: YgListTile(title: 'Medium sliver top app bar (title only)'),
            ),
            YgSliverTopAppBar(
              automaticallyImplyLeading: false,
              title: 'Page title',
              variant: YgSliverTopAppBarVariant.medium,
            ),
            SliverToBoxAdapter(
              child: YgListTile(title: 'Medium sliver top app bar (title and leading)'),
            ),
            YgSliverTopAppBar(
              leading: YgIcon(YgIcons.caretLeft),
              title: 'Page title',
              variant: YgSliverTopAppBarVariant.medium,
            ),
            SliverToBoxAdapter(
              child: YgListTile(title: 'Medium sliver top app bar (title and actions)'),
            ),
            YgSliverTopAppBar(
              actions: <Widget>[
                YgIcon(YgIcons.alert),
                SizedBox(width: 10.0),
              ],
              automaticallyImplyLeading: false,
              title: 'Page title',
              variant: YgSliverTopAppBarVariant.medium,
            ),
            SliverToBoxAdapter(
              child: YgListTile(title: 'Medium sliver top app bar (title, leading and actions)'),
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
              variant: YgSliverTopAppBarVariant.medium,
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
