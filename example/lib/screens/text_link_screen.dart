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
      componentName: 'Text Link',
      componentDesc: 'Text Link',
      supernovaLink: 'Link',
      scrollable: false,
      child: Column(
        children: <Widget>[
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
          YgTextLink(
            onPressed: () {},
            text: 'Link',
            icon: const Icon(
              Icons.open_in_browser_rounded,
            ),
            size: YgTextLinkSize.small,
            weight: YgTextLinkWeight.weak,
          ),
          YgTextLink(
            onPressed: () {},
            text: 'Link',
            icon: const Icon(
              Icons.open_in_browser_rounded,
            ),
            size: YgTextLinkSize.small,
            weight: YgTextLinkWeight.strong,
          ),
          YgTextLink(
            onPressed: () {},
            text: 'Link',
            icon: const Icon(
              Icons.open_in_browser_rounded,
            ),
            size: YgTextLinkSize.medium,
            weight: YgTextLinkWeight.weak,
          ),
          YgTextLink(
            onPressed: () {},
            text: 'Link',
            icon: const Icon(
              Icons.open_in_browser_rounded,
            ),
            size: YgTextLinkSize.medium,
            weight: YgTextLinkWeight.strong,
          ),
        ],
      ),
    );
  }
}
