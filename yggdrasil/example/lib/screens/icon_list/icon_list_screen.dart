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
  List<YgIconData> allIcons = YgIcons.allIcons;

  @override
  Widget build(BuildContext context) {
    return DemoScreen(
      scrollable: false,
      componentName: 'Icon',
      child: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: YgSection(
              title: 'List of all icons in YGG',
              child: YgTextField(
                label: 'Search',
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.search,
                autocorrect: false,
                textCapitalization: TextCapitalization.none,
                onChanged: (String value) {
                  allIcons = YgIcons.allIcons.where((YgIconData iconData) {
                    return iconData.path.contains(value) || iconData.name.contains(value);
                  }).toList();

                  setState(() {});
                },
              ),
            ),
          ),
          SliverList.builder(
            itemBuilder: (BuildContext context, int index) {
              final YgIconData iconData = allIcons[index];
              final String iconName = iconData.name;
              final String iconPath = iconData.path;

              return YgListTile(
                title: iconName,
                subtitle: iconPath,
                leadingWidgets: <YgIcon>[
                  YgIcon.embeddedColor(iconData),
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
