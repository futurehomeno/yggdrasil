import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

class ListExample extends StatelessWidget {
  const ListExample({super.key});

  @override
  Widget build(BuildContext context) {
    final List<YgListTile> children = <YgListTile>[
      YgListTile(
        title: 'List item',
        subtitle: 'Subtitle',
        onTap: () {},
      ),
      YgListTile(
        title: 'List item',
        subtitle: 'Subtitle',
        onTap: () {},
      ),
      YgListTile(
        title: 'List item',
        subtitle: 'Subtitle',
        onTap: () {},
      ),
    ];

    return Column(
      children: <Widget>[
        YgExpandingSection.list(
          title: 'With title',
          children: children,
        ),
        YgExpandingSection.list(
          title: 'With title and subtitle',
          subtitle: 'The subtitle',
          children: children,
        ),
        YgExpandingSection.list(
          title: 'With title and tag',
          tag: const YgTag(
            variant: YgTagVariant.informative,
            size: YgTagSize.small,
            text: 'Tag Basic',
          ),
          children: children,
        ),
        YgExpandingSection.list(
          title: 'With title and icon',
          icon: const YgIcon(YgIcons.placeholder),
          children: children,
        ),
        YgExpandingSection.list(
          title: 'With title, icon, tag and long subtitle',
          subtitle: 'Cupidatat ea voluptate exercitation irure ea occaecat pariatur elit minim non incididunt in.',
          icon: const YgIcon(YgIcons.placeholder),
          tag: const YgTag(
            variant: YgTagVariant.informative,
            size: YgTagSize.small,
            text: 'Tag Basic',
          ),
          children: children,
        ),
      ],
    );
  }
}
