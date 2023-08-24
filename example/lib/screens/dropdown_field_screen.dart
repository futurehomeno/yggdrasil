import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/yg_route_builder.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class DropdownFieldScreen extends StatefulWidget {
  const DropdownFieldScreen({super.key});

  static const String routeName = 'DropdownFieldScreen';

  static PageRouteBuilder<Widget> route() {
    return YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const DropdownFieldScreen(),
    );
  }

  @override
  State<DropdownFieldScreen> createState() => _DropdownFieldScreenState();
}

class _DropdownFieldScreenState extends State<DropdownFieldScreen> {
  final FormKey formKey = FormKey();
  final TextFieldKey emailKey = TextFieldKey();
  final TextFieldKey passwordKey = TextFieldKey();
  final TextFieldKey passwordConfirmKey = TextFieldKey();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: DemoScreen(
        componentName: 'DropdownField',
        componentDesc: 'Dropdown Field',
        supernovaLink: 'Dropdown',
        child: Column(
          children: List<Widget>.generate(
            10,
            (int index) => YgDropdownField<String>(
              allowDeselect: true,
              label: 'Label',
              dropdownAction: DropdownAction.menu,
              entries: List<YgDropdownEntry<String>>.generate(
                20,
                (int index) => YgDropdownEntry<String>(
                  icon: const YgIcon(YgIcons.alert),
                  subtitle: 'Subtitle of value $index',
                  title: 'Value $index',
                  value: 'value$index',
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
