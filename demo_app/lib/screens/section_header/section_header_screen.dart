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
      child: YgLayoutBody(
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
              title: 'With title and trailing widget',
              trailing: DemoPlaceholder(
                height: 25,
              ),
            ),
            YgSectionHeader(
              title: 'With title and icon',
              icon: YgIcons.placeholder,
            ),
            YgSectionHeader(
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
