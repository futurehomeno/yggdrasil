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
              dropdownAction: YgDropdownAction.menu,
              entries: _generateEntries(4),
            ),
            YgDropdownField<String>.multiSelect(
              allowDeselect: true,
              label: 'Multi select',
              dropdownAction: YgDropdownAction.menu,
              entries: _generateEntries(4),
            ),
          ].withVerticalSpacing(15),
        ),
      ),
    );
  }

  List<YgDropdownEntry<String>> _generateEntries(int amount) {
    return List<YgDropdownEntry<String>>.generate(
      amount,
      (int index) => YgDropdownEntry<String>(
        icon: YgIcon(YgIcons.allIconPaths[index]),
        subtitle: 'Subtitle of value $index',
        title: 'Value $index',
        value: 'value$index',
      ),
    );
  }
}
