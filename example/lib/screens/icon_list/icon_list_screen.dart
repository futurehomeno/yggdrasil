import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class IconListScreen extends StatefulWidget {
  const IconListScreen({super.key});

  static const String routeName = 'IconsList';

  static PageRouteBuilder<Widget> route() {
    return const YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const IconListScreen(),
    );
  }

  @override
  State<IconListScreen> createState() => _IconListScreenState();
}

class _IconListScreenState extends State<IconListScreen> {
  List<Map<String, String>> allIcons = YgIcons.allIcons;

  @override
  Widget build(BuildContext context) {
    return DemoScreen(
      scrollable: false,
      componentName: 'Icon',
      componentDesc: 'Icons',
      supernovaLink: 'Link',
      child: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: YgSection.base(
              title: 'List of all icons in YGG',
              child: YgTextField(
                label: 'Search',
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.search,
                autocorrect: false,
                textCapitalization: TextCapitalization.none,
                onChanged: (String value) {
                  allIcons = YgIcons.allIcons.where((Map<String, String> icon) {
                    return icon.keys.first.contains(value) || icon.values.first.contains(value);
                  }).toList();
                  setState(() {});
                },
              ),
            ),
          ),
          SliverList.builder(
            itemBuilder: (BuildContext context, int index) {
              final String iconPath = allIcons[index].values.first;
              final String iconName = allIcons[index].keys.first;

              return YgListTile(
                title: iconName,
                subtitle: iconPath,
                leadingWidgets: <YgIcon>[
                  YgIcon(iconPath, useEmbeddedColor: true),
                ],
              );
            },
            itemCount: allIcons.length,
          ),
        ],
      ),
    );
  }
}
