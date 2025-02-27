import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class RegularExample extends StatelessWidget {
  const RegularExample({super.key});

  @override
  Widget build(BuildContext context) {
    return YgLayoutBody(
      child: Column(
        children: <Widget>[
          const YgSection(
            child: DemoPlaceholder(),
          ),
          const YgSection(
            title: 'With title',
            child: DemoPlaceholder(),
          ),
          YgSection(
            title: 'With clickable header',
            onHeaderPressed: () {},
            child: const DemoPlaceholder(),
          ),
          const YgSection(
            title: 'With title and subtitle',
            subtitle: 'The subtitle',
            child: DemoPlaceholder(),
          ),
          const YgSection(
            title: 'With title and trailing widget',
            trailing: DemoPlaceholder(height: 25),
            child: DemoPlaceholder(),
          ),
          const YgSection(
            title: 'With title and icon',
            icon: YgIcons.placeholder,
            child: DemoPlaceholder(),
          ),
          const YgSection(
            title: 'With title, icon, trailing widget and long subtitle',
            subtitle: 'Cupidatat ea voluptate exercitation irure ea occaecat pariatur elit minim non incididunt in.',
            icon: YgIcons.placeholder,
            trailing: DemoPlaceholder(height: 25),
            child: DemoPlaceholder(),
          ),
        ],
      ),
    );
  }
}
