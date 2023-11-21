import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class ExpandingSectionScreen extends StatelessWidget {
  const ExpandingSectionScreen({super.key});

  static const String routeName = 'ExpandingSectionScreen';

  static PageRouteBuilder<Widget> route() {
    return const YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const ExpandingSectionScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const DemoScreen(
      componentName: 'ExpandingSection',
      child: Column(
        children: <Widget>[
          YgExpandingSection(
            title: 'With title',
            child: DemoPlaceholder(),
          ),
          YgExpandingSection(
            title: 'With title and subtitle',
            subtitle: 'The subtitle',
            child: DemoPlaceholder(),
          ),
          YgExpandingSection(
            title: 'With title and tag',
            tag: YgTag(
              variant: YgTagVariant.informative,
              size: YgTagSize.small,
              child: Text('Tag Basic'),
            ),
            child: DemoPlaceholder(),
          ),
          YgExpandingSection(
            title: 'With title and icon',
            icon: YgIcon(YgIcons.placeholder),
            child: DemoPlaceholder(),
          ),
          YgExpandingSection(
            title: 'With title, icon, tag and long subtitle',
            subtitle:
                'Minim nisi exercitation ipsum voluptate proident irure irure ut tempor magna ipsum officia et ut.',
            icon: YgIcon(YgIcons.placeholder),
            tag: YgTag(
              variant: YgTagVariant.informative,
              size: YgTagSize.small,
              child: Text('Tag Basic'),
            ),
            child: DemoPlaceholder(),
          ),
        ],
      ),
    );
  }
}
