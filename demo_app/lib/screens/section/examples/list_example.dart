import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

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
    ];

    return Column(
      children: <Widget>[
        YgSection.list(
          children: children,
        ),
        YgSection.list(
          title: 'With title',
          children: children,
        ),
        YgSection.list(
          title: 'With title and subtitle',
          subtitle: 'The subtitle',
          children: children,
        ),
        YgSection.list(
          title: 'With title and trailing widget',
          trailing: DemoPlaceholder(height: 25),
          children: children,
        ),
        YgSection.list(
          title: 'With title and icon',
          icon: YgIcons.placeholder,
          children: children,
        ),
        YgSection.list(
          title: 'With title, icon, trailing widget and long subtitle',
          subtitle: 'Cupidatat ea voluptate exercitation irure ea occaecat pariatur elit minim non incididunt in.',
          icon: YgIcons.placeholder,
          trailing: DemoPlaceholder(height: 25),
          children: children,
        ),
      ],
    );
  }
}
