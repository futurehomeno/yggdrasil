import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class TagScreen extends StatelessWidget {
  const TagScreen({super.key});

  static const String routeName = 'TagsScreen';

  static PageRouteBuilder<Widget> route() {
    return YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const TagScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DemoScreen(
      componentName: 'Tag',
      componentDesc: 'Tags',
      supernovaLink: 'Link',
      child: Column(
        children: <Widget>[
          YgSectionColumn(
            children: <Widget>[
              const YgSectionTile(title: 'Variants'),
              const YgTag(
                child: Text('Neutral'),
              ),
              const YgTag(
                variant: YgTagVariant.informative,
                child: Text('Informative'),
              ),
              const YgTag(
                variant: YgTagVariant.positive,
                child: Text('Positive'),
              ),
              const YgTag(
                variant: YgTagVariant.warning,
                child: Text('Warning'),
              ),
              const YgTag(
                variant: YgTagVariant.negative,
                child: Text('Negative'),
              ),
            ],
          ),
          YgSectionColumn(
            children: <Widget>[
              const YgSectionTile(title: 'Sizes'),
              const YgTag(
                size: YgTagSize.small,
                child: Text('Small'),
              ),
              const YgTag(
                size: YgTagSize.medium,
                child: Text('Medium'),
              ),
            ],
          ),
          YgSectionColumn(
            children: <Widget>[
              const YgSectionTile(title: 'With icons'),
              YgTag.leadingIcon(
                icon: const YgIcon(YgIcons.info),
                child: const Text('Leading icon'),
              ),
              YgTag.trailingIcon(
                icon: const YgIcon(YgIcons.info),
                child: const Text('Trailing icon'),
              ),
              YgTag.doubleIcon(
                leadingIcon: const YgIcon(YgIcons.info),
                trailingIcon: const YgIcon(YgIcons.info),
                child: const Text('Double icon'),
              ),
            ],
          ),
          YgSectionColumn(
            children: <Widget>[
              const YgSectionTile(title: 'Clickable'),
              YgTag.leadingIcon(
                icon: const YgIcon(YgIcons.info),
                onPressed: () {},
                child: const Text('Click me!'),
              ),
              YgTag.leadingIcon(
                icon: const YgIcon(YgIcons.info),
                onPressed: null,
                child: const Text('Disabled'),
              ),
            ],
          ),
          YgSectionColumn(
            children: <Widget>[
              const YgSectionTile(title: 'Weights'),
              YgTag.leadingIcon(
                icon: const YgIcon(YgIcons.info),
                weight: YgTagWeight.strong,
                child: const Text('Neutral strong'),
              ),
              YgTag.leadingIcon(
                icon: const YgIcon(YgIcons.info),
                variant: YgTagVariant.informative,
                weight: YgTagWeight.strong,
                child: const Text('Informative strong'),
              ),
              YgTag.leadingIcon(
                icon: const YgIcon(YgIcons.info),
                variant: YgTagVariant.positive,
                weight: YgTagWeight.strong,
                child: const Text('Positive strong'),
              ),
              YgTag.leadingIcon(
                icon: const YgIcon(YgIcons.info),
                variant: YgTagVariant.warning,
                weight: YgTagWeight.strong,
                child: const Text('Warning strong'),
              ),
              YgTag.leadingIcon(
                icon: const YgIcon(YgIcons.info),
                variant: YgTagVariant.negative,
                weight: YgTagWeight.strong,
                child: const Text('Negative strong'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
