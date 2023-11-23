import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class RegularExample extends StatelessWidget {
  const RegularExample({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: <Widget>[
        YgExpandingSection(
          title: 'With title',
          child: DemoPlaceholder(),
        ),
        YgExpandingSection(
          title: 'With title and subtitle',
          subtitle: 'The subtitle',
          child: DemoPlaceholder(),
        ),
        YgExpandingSection(
          title: 'With title and tag',
          tag: YgTag(
            variant: YgTagVariant.informative,
            size: YgTagSize.small,
            child: Text('Tag Basic'),
          ),
          child: DemoPlaceholder(),
        ),
        YgExpandingSection(
          title: 'With title and icon',
          icon: YgIcon(YgIcons.placeholder),
          child: DemoPlaceholder(),
        ),
        YgExpandingSection(
          title: 'With title, icon, tag and long subtitle',
          subtitle: 'Cupidatat ea voluptate exercitation irure ea occaecat pariatur elit minim non incididunt in.',
          icon: YgIcon(YgIcons.placeholder),
          tag: YgTag(
            variant: YgTagVariant.informative,
            size: YgTagSize.small,
            child: Text('Tag Basic'),
          ),
          child: DemoPlaceholder(),
        ),
      ],
    );
  }
}
