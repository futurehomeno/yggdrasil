import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/yg_route_builder.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class DropdownFieldScreen extends StatelessWidget {
  const DropdownFieldScreen({super.key});

  // ignore: prefer-widget-private-members
  static const String routeName = 'DropdownFieldScreen';

  // ignore: prefer-widget-private-members
  static PageRouteBuilder<Widget> route() {
    return YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const DropdownFieldScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: DemoScreen(
        componentName: 'DropdownField',
        componentDesc: 'Dropdown Field',
        supernovaLink: 'Dropdown',
        child: Column(
          children: <Widget>[
            YgDropdownField<String>(
              allowDeselect: true,
              label: 'Single select',
              entries: List<YgDropdownEntry<String>>.generate(
                20,
                (int index) => YgDropdownEntry<String>(
                  icon: YgIcon(YgIcons.allIconPaths[index]),
                  subtitle: 'Subtitle of value $index',
                  title: 'Value $index',
                  value: 'value$index',
                ),
              ),
            ),
            YgDropdownField<String>.multiSelect(
              allowDeselect: true,
              label: 'Multi select',
              entries: List<YgDropdownEntry<String>>.generate(
                20,
                (int index) => YgDropdownEntry<String>(
                  icon: YgIcon(YgIcons.allIconPaths[index]),
                  subtitle: 'Subtitle of value $index',
                  title: 'Value $index',
                  value: 'value$index',
                ),
              ),
            ),
          ].withVerticalSpacing(15),
        ),
      ),
    );
  }
}
