import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class TextLinkScreen extends StatelessWidget {
  const TextLinkScreen({super.key});

  static const String routeName = 'TextLinkScreen';

  static PageRouteBuilder<Widget> route() {
    return const YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const TextLinkScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DemoScreen(
      componentName: 'TextLink',
      child: Column(
        children: <Widget>[
          YgSection.base(
            title: 'Sizes',
            subtitle: 'Spacing between links added manually.',
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                YgTextLink(
                  onPressed: () {},
                  text: 'Small',
                  size: YgTextLinkSize.small,
                  weight: YgTextLinkWeight.weak,
                ),
                YgTextLink(
                  onPressed: () {},
                  text: 'Medium',
                  size: YgTextLinkSize.medium,
                  weight: YgTextLinkWeight.weak,
                ),
              ].withHorizontalSpacing(10.0),
            ),
          ),
          YgSection.base(
            title: 'Weights',
            subtitle: 'Spacing between links added manually.',
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                YgTextLink(
                  onPressed: () {},
                  text: 'Weak',
                  weight: YgTextLinkWeight.weak,
                ),
                YgTextLink(
                  onPressed: () {},
                  text: 'Strong',
                  weight: YgTextLinkWeight.strong,
                ),
              ].withHorizontalSpacing(10.0),
            ),
          ),
          YgSection.base(
            title: 'Disabled text link',
            child: YgTextLink(
              text: 'Disabled',
              onPressed: null,
            ),
          ),
          YgSection.base(
            title: 'External text link',
            child: YgTextLink(
              onPressed: () {},
              text: 'Link',
              external: true,
            ),
          ),
        ],
      ),
    );
  }
}
