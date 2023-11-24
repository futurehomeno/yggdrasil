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
                text: 'Neutral',
              ),
              const YgTag(
                variant: YgTagVariant.informative,
                text: 'Informative',
              ),
              const YgTag(
                variant: YgTagVariant.positive,
                text: 'Positive',
              ),
              const YgTag(
                variant: YgTagVariant.warning,
                text: 'Warning',
              ),
              const YgTag(
                variant: YgTagVariant.negative,
                text: 'Negative',
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
                  text: 'Small',
                ),
                const YgTag(
                  size: YgTagSize.medium,
                  text: 'Medium',
                ),
              ].withHorizontalSpacing(10.0),
            ),
          ),
          YgSection.column(
            title: 'With icons',
            children: <Widget>[
              const YgTag.leadingIcon(
                icon: YgIcon(YgIcons.info),
                text: 'Leading icon',
              ),
              const YgTag.trailingIcon(
                icon: YgIcon(YgIcons.info),
                text: 'Trailing icon',
              ),
              const YgTag.doubleIcon(
                leadingIcon: YgIcon(YgIcons.info),
                trailingIcon: YgIcon(YgIcons.info),
                text: 'Double icon',
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
                  text: 'Click me!',
                  onPressed: () {},
                ),
                const YgTag.leadingIcon(
                  icon: YgIcon(YgIcons.info),
                  onPressed: null,
                  text: 'Disabled',
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
                text: 'Neutral strong',
              ),
              const YgTag.leadingIcon(
                icon: YgIcon(YgIcons.info),
                variant: YgTagVariant.informative,
                weight: YgTagWeight.strong,
                text: 'Informative strong',
              ),
              const YgTag.leadingIcon(
                icon: YgIcon(YgIcons.info),
                variant: YgTagVariant.positive,
                weight: YgTagWeight.strong,
                text: 'Positive strong',
              ),
              const YgTag.leadingIcon(
                icon: YgIcon(YgIcons.info),
                variant: YgTagVariant.warning,
                weight: YgTagWeight.strong,
                text: 'Warning strong',
              ),
              const YgTag.leadingIcon(
                icon: YgIcon(YgIcons.info),
                variant: YgTagVariant.negative,
                weight: YgTagWeight.strong,
                text: 'Negative strong',
              ),
            ].withVerticalSpacing(10.0),
          ),
        ],
      ),
    );
  }
}
