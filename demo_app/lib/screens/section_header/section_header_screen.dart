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
    return DemoScreen(
      componentName: 'SectionHeader',
      child: YgLayoutBody(
        child: Column(
          children: <Widget>[
            const YgSectionHeader(
              title: 'With only a title',
            ),
            YgSectionHeader(
              title: 'Clickable',
              onPressed: () {},
            ),
            const YgSectionHeader(
              title: 'With title and subtitle',
              subtitle: 'The subtitle',
            ),
            const YgSectionHeader(
              title: 'With title and trailing widget',
              trailing: DemoPlaceholder(
                height: 25,
              ),
            ),
            const YgSectionHeader(
              title: 'With title and icon',
              icon: YgIcons.placeholder,
            ),
            const YgSectionHeader(
              title: 'With title, icon, trailing widget and long subtitle',
              subtitle: 'Cupidatat ea voluptate exercitation irure ea occaecat pariatur elit minim non incididunt in.',
              icon: YgIcons.placeholder,
              trailing: DemoPlaceholder(
                height: 25,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
