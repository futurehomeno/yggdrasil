import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/screens/top_app_bar/widgets/_widgets.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class TopAppBarScreen extends StatelessWidget {
  const TopAppBarScreen({super.key});

  static const String routeName = 'TopAppBarScreen';

  static PageRouteBuilder<Widget> route() {
    return const YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const TopAppBarScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DemoScreen(
      componentName: 'TopAppBar',
      componentDesc: 'TopAppBar',
      supernovaLink: 'Link',
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height,
        child: const Column(
          children: <Widget>[
            YgListTile(title: 'Default non-sliver TopAppBar'),
            DefaultTopAppBarPreview(),
            SizedBox(height: 20.0),
            YgListTile(title: 'Sliver TopAppBar'),
            Expanded(
              child: SliverTopAppBarPreview(),
            ),
          ],
        ),
      ),
    );
  }
}
