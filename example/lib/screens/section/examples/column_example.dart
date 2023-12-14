import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/widgets/demo_placeholder.dart';

class ColumnExample extends StatelessWidget {
  const ColumnExample({super.key});

  @override
  Widget build(BuildContext context) {
    const List<Widget> children = <Widget>[
      DemoPlaceholder(),
      SizedBox(height: 10),
      DemoPlaceholder(),
    ];

    return const Column(
      children: <Widget>[
        YgSection.column(
          children: children,
        ),
        YgSection.column(
          title: 'With title',
          children: children,
        ),
        YgSection.column(
          title: 'With title and subtitle',
          subtitle: 'The subtitle',
          children: children,
        ),
        YgSection.column(
          title: 'With title and tag',
          tag: YgTag(
            variant: YgTagVariant.informative,
            size: YgTagSize.small,
            child: Text('Tag Basic'),
          ),
          children: children,
        ),
        YgSection.column(
          title: 'With title and icon',
          icon: YgIcons.placeholder,
          children: children,
        ),
        YgSection.column(
          title: 'With title, icon, tag and long subtitle',
          subtitle: 'Cupidatat ea voluptate exercitation irure ea occaecat pariatur elit minim non incididunt in.',
          icon: YgIcons.placeholder,
          tag: YgTag(
            variant: YgTagVariant.informative,
            size: YgTagSize.small,
            child: Text('Tag Basic'),
          ),
          children: children,
        ),
      ],
    );
  }
}
