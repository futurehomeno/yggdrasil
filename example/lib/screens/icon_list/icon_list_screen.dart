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
  List<MapEntry<String, String>> allIcons = YgIcons.allIcons.entries.toList();

  @override
  Widget build(BuildContext context) {
    return DemoScreen(
      scrollable: false,
      componentName: 'Icon',
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
                  allIcons = YgIcons.allIcons.entries.where((MapEntry<String, String> icon) {
                    return icon.key.contains(value) || icon.value.contains(value);
                  }).toList();

                  setState(() {});
                },
              ),
            ),
          ),
          SliverList.builder(
            itemBuilder: (BuildContext context, int index) {
              final String iconName = allIcons[index].key;
              final String iconPath = allIcons[index].value;

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
