import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class SectionHeaderScreen extends StatelessWidget {
  const SectionHeaderScreen({super.key});

  static const String routeName = 'SectionHeaderScreen';

  static PageRouteBuilder<Widget> route() {
    return const YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const SectionHeaderScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const DemoScreen(
      componentName: 'SectionHeader',
      child: Column(
        children: <Widget>[
          YgSectionHeader(
            title: 'With only a title',
          ),
          YgSectionHeader(
            title: 'With title and subtitle',
            subtitle: 'The subtitle',
          ),
          YgSectionHeader(
            title: 'With title and tag',
            trailing: YgTag(
              variant: YgTagVariant.informative,
              size: YgTagSize.small,
              child: Text('Tag Basic'),
            ),
          ),
          YgSectionHeader(
            title: 'With title and icon',
            icon: YgIcons.placeholder,
          ),
          YgSectionHeader(
            title: 'With title, icon, tag and long subtitle',
            subtitle: 'Cupidatat ea voluptate exercitation irure ea occaecat pariatur elit minim non incididunt in.',
            icon: YgIcons.placeholder,
            trailing: YgTag(
              variant: YgTagVariant.informative,
              size: YgTagSize.small,
              child: Text('Tag Basic'),
            ),
          ),
        ],
      ),
    );
  }
}
