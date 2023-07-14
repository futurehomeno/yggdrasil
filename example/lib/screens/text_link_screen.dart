import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class TextLinkScreen extends StatelessWidget {
  const TextLinkScreen({super.key});

  static const String routeName = 'TextLinkScreen';

  static PageRouteBuilder<Widget> route() {
    return YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const TextLinkScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return YgScreen(
      componentName: 'TextLink',
      componentDesc: 'Text links',
      supernovaLink: 'Link',
      child: Column(
        children: <Widget>[
          const YgListTile(title: 'Enabled text link'),
          YgTextLink(
            onPressed: () {},
            text: 'Link',
            size: YgTextLinkSize.small,
            weight: YgTextLinkWeight.weak,
          ),
          YgTextLink(
            onPressed: () {},
            text: 'Link',
            size: YgTextLinkSize.small,
            weight: YgTextLinkWeight.strong,
          ),
          YgTextLink(
            onPressed: () {},
            text: 'Link',
            size: YgTextLinkSize.medium,
            weight: YgTextLinkWeight.weak,
          ),
          YgTextLink(
            onPressed: () {},
            text: 'Link',
            size: YgTextLinkSize.medium,
            weight: YgTextLinkWeight.strong,
          ),
          const YgListTile(title: 'Disabled text link'),
          YgTextLink(
            text: 'Link',
            size: YgTextLinkSize.small,
            weight: YgTextLinkWeight.weak,
            onPressed: null,
          ),
          YgTextLink(
            text: 'Link',
            size: YgTextLinkSize.small,
            weight: YgTextLinkWeight.strong,
            onPressed: null,
          ),
          YgTextLink(
            text: 'Link',
            size: YgTextLinkSize.medium,
            weight: YgTextLinkWeight.weak,
            onPressed: null,
          ),
          YgTextLink(
            text: 'Link',
            size: YgTextLinkSize.medium,
            weight: YgTextLinkWeight.strong,
            onPressed: null,
          ),
          const YgListTile(title: 'Text link w/ icon'),
          Column(
            children: <Widget>[
              YgTextLink(
                onPressed: () {},
                text: 'Link',
                external: true,
                size: YgTextLinkSize.small,
                weight: YgTextLinkWeight.weak,
              ),
              YgTextLink(
                onPressed: () {},
                text: 'Link',
                external: true,
                size: YgTextLinkSize.small,
                weight: YgTextLinkWeight.strong,
              ),
              YgTextLink(
                onPressed: () {},
                text: 'Link',
                external: true,
                size: YgTextLinkSize.medium,
                weight: YgTextLinkWeight.weak,
              ),
              YgTextLink(
                onPressed: () {},
                text: 'Link',
                external: true,
                size: YgTextLinkSize.medium,
                weight: YgTextLinkWeight.strong,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
