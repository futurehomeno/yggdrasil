import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class TagScreen extends StatelessWidget {
  const TagScreen({super.key});

  static const String routeName = 'TagsScreen';

  static PageRouteBuilder<Widget> route() {
    return const YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const TagScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DemoScreen(
      componentName: 'Tag',
      child: Column(
        children: <Widget>[
          YgSection.column(
            title: 'Variants',
            children: <Widget>[
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
            ].withVerticalSpacing(10.0),
          ),
          YgSection(
            title: 'Sizes',
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const YgTag(
                  size: YgTagSize.small,
                  child: Text('Small'),
                ),
                const YgTag(
                  size: YgTagSize.medium,
                  child: Text('Medium'),
                ),
              ].withHorizontalSpacing(10.0),
            ),
          ),
          YgSection.column(
            title: 'With icons',
            children: <Widget>[
              const YgTag.leadingIcon(
                icon: YgIcon(YgIcons.info),
                child: Text('Leading icon'),
              ),
              const YgTag.trailingIcon(
                icon: YgIcon(YgIcons.info),
                child: Text('Trailing icon'),
              ),
              const YgTag.doubleIcon(
                leadingIcon: YgIcon(YgIcons.info),
                trailingIcon: YgIcon(YgIcons.info),
                child: Text('Double icon'),
              ),
            ].withVerticalSpacing(10.0),
          ),
          YgSection(
            title: 'Clickable',
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                YgTag.leadingIcon(
                  icon: const YgIcon(YgIcons.info),
                  child: const Text('Click me!'),
                  onPressed: () {},
                ),
                const YgTag.leadingIcon(
                  icon: YgIcon(YgIcons.info),
                  onPressed: null,
                  child: Text('Disabled'),
                ),
              ].withHorizontalSpacing(10.0),
            ),
          ),
          YgSection.column(
            title: 'Weights',
            children: <Widget>[
              const YgTag.leadingIcon(
                icon: YgIcon(YgIcons.info),
                weight: YgTagWeight.strong,
                child: Text('Neutral strong'),
              ),
              const YgTag.leadingIcon(
                icon: YgIcon(YgIcons.info),
                variant: YgTagVariant.informative,
                weight: YgTagWeight.strong,
                child: Text('Informative strong'),
              ),
              const YgTag.leadingIcon(
                icon: YgIcon(YgIcons.info),
                variant: YgTagVariant.positive,
                weight: YgTagWeight.strong,
                child: Text('Positive strong'),
              ),
              const YgTag.leadingIcon(
                icon: YgIcon(YgIcons.info),
                variant: YgTagVariant.warning,
                weight: YgTagWeight.strong,
                child: Text('Warning strong'),
              ),
              const YgTag.leadingIcon(
                icon: YgIcon(YgIcons.info),
                variant: YgTagVariant.negative,
                weight: YgTagWeight.strong,
                child: Text('Negative strong'),
              ),
            ].withVerticalSpacing(10.0),
          ),
        ],
      ),
    );
  }
}
