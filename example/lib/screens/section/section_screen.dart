import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class SectionScreen extends StatelessWidget {
  const SectionScreen({super.key});

  static const String routeName = 'SectionScreen';

  static PageRouteBuilder<Widget> route() {
    return const YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const SectionScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const DemoScreen(
      componentName: 'SnackBar',
      child: Column(
        children: <Widget>[
          YgSection(
            title: 'With title',
            child: DemoPlaceholder(),
          ),
          YgSection(
            title: 'With title and subtitle',
            subtitle: 'The subtitle',
            child: DemoPlaceholder(),
          ),
          YgSection(
            title: 'With title and tag',
            tag: YgTag(
              variant: YgTagVariant.informative,
              size: YgTagSize.small,
              child: Text('Tag Basic'),
            ),
            child: DemoPlaceholder(),
          ),
          YgSection(
            title: 'With title and icon',
            icon: YgIcon(YgIcons.placeholder),
            child: DemoPlaceholder(),
          ),
          YgSection(
            title: 'With title, icon, tag and long subtitle',
            subtitle:
                'This subtitle is pretty long, the idea being that you can get a good look at how the section handles wrapping of subtitles when there is a tag provided.',
            icon: YgIcon(YgIcons.placeholder),
            tag: YgTag(
              variant: YgTagVariant.informative,
              size: YgTagSize.small,
              child: Text('Tag Basic'),
            ),
            child: DemoPlaceholder(),
          ),
          YgSection.expanding(
            title: 'With title',
            child: DemoPlaceholder(),
          ),
          YgSection.expanding(
            title: 'With title and subtitle',
            subtitle: 'The subtitle',
            child: DemoPlaceholder(),
          ),
          YgSection.expanding(
            title: 'With title and tag',
            tag: YgTag(
              variant: YgTagVariant.informative,
              size: YgTagSize.small,
              child: Text('Tag Basic'),
            ),
            child: DemoPlaceholder(),
          ),
          YgSection.expanding(
            title: 'With title and icon',
            icon: YgIcon(YgIcons.placeholder),
            child: DemoPlaceholder(),
          ),
          YgSection.expanding(
            title: 'With title, icon, tag and long subtitle',
            subtitle:
                'This subtitle is pretty long, the idea being that you can get a good look at how the section handles wrapping of subtitles when there is a tag provided.',
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
