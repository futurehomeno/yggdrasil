import 'package:flutter/material.dart';
import 'package:yggdrasil/app/core/_core.dart';
import 'package:yggdrasil/app/widgets/_widgets.dart';
import 'package:yggdrasil/src/components/_components.dart';

class TagsScreen extends StatelessWidget {
  const TagsScreen({super.key});

  static const String routeName = 'TagsScreen';

  static PageRouteBuilder<Widget> route() {
    return YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const TagsScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return YgScreen(
      componentName: 'Tag',
      componentDesc: 'Tags',
      supernovaLink: 'Link',
      child: Column(
        children: <Widget>[
          YgTag(
            variant: YgTagVariant.neutral,
            size: YgTagSize.small,
            impact: YgTagImpact.weak,
            onPressed: () {},
            child: const Text('Neutral Weak'),
          ),
          YgTag(
            variant: YgTagVariant.neutral,
            size: YgTagSize.small,
            impact: YgTagImpact.strong,
            onPressed: () {},
            child: const Text('Neutral Strong'),
          ),
        ],
      ),
    );
  }
}
