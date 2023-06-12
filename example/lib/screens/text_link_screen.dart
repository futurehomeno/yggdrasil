import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/yg_route_builder.dart';
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
      componentName: 'Dialog',
      componentDesc: 'Dialog',
      supernovaLink: 'Link',
      scrollable: false,
      child: Column(
        children: const <Widget>[
          YgTextLink(
            text: 'Link',
            url: 'https://futurehome.no/',
            size: YgTextLinkSize.small,
            weight: YgTextLinkWeight.weak,
          ),
          YgTextLink(
            text: 'Link',
            url: 'https://futurehome.no/',
            size: YgTextLinkSize.small,
            weight: YgTextLinkWeight.strong,
          ),
          YgTextLink(
            text: 'Link',
            url: 'https://futurehome.no/',
            size: YgTextLinkSize.medium,
            weight: YgTextLinkWeight.weak,
          ),
          YgTextLink(
            text: 'Link',
            url: 'https://futurehome.no/',
            size: YgTextLinkSize.medium,
            weight: YgTextLinkWeight.strong,
          ),
          YgTextLink(
            text: 'Link',
            url: 'https://futurehome.no/',
            size: YgTextLinkSize.small,
            weight: YgTextLinkWeight.weak,
            disabled: true,
          ),
          YgTextLink(
            text: 'Link',
            url: 'https://futurehome.no/',
            size: YgTextLinkSize.small,
            weight: YgTextLinkWeight.strong,
            disabled: true,
          ),
          YgTextLink(
            text: 'Link',
            url: 'https://futurehome.no/',
            size: YgTextLinkSize.medium,
            weight: YgTextLinkWeight.weak,
            disabled: true,
          ),
          YgTextLink(
            text: 'Link',
            url: 'https://futurehome.no/',
            size: YgTextLinkSize.medium,
            weight: YgTextLinkWeight.strong,
            disabled: true,
          ),
          YgTextLink(
            text: 'Link',
            icon: Icon(
              Icons.open_in_browser_rounded,
            ),
            url: 'https://futurehome.no/',
            size: YgTextLinkSize.small,
            weight: YgTextLinkWeight.weak,
          ),
          YgTextLink(
            text: 'Link',
            icon: Icon(
              Icons.open_in_browser_rounded,
            ),
            url: 'https://futurehome.no/',
            size: YgTextLinkSize.small,
            weight: YgTextLinkWeight.strong,
          ),
          YgTextLink(
            text: 'Link',
            icon: Icon(
              Icons.open_in_browser_rounded,
            ),
            url: 'https://futurehome.no/',
            size: YgTextLinkSize.medium,
            weight: YgTextLinkWeight.weak,
          ),
          YgTextLink(
            text: 'Link',
            icon: Icon(
              Icons.open_in_browser_rounded,
            ),
            url: 'https://futurehome.no/',
            size: YgTextLinkSize.medium,
            weight: YgTextLinkWeight.strong,
          ),
        ],
      ),
    );
  }
}
