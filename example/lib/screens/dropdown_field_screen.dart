import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/yg_route_builder.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';
import 'package:yggdrasil_demo/widgets/login_form_dialog.dart';

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
        child: Column(children: <Widget>[
          YgDropdownField<String>(
            allowDeselect: true,
            label: 'Label',
            entries: <YgDropdownEntry<String>>[
              YgDropdownEntry<String>(
                title: 'Value1',
                value: 'Value1',
              ),
              YgDropdownEntry<String>(
                title: 'Value2',
                value: 'Value2',
              ),
              YgDropdownEntry<String>(
                title: 'Value3',
                value: 'Value3',
              ),
            ],
          ),
        ]),
      ),
    );
  }

  void _validateForm() {
    FocusScope.of(context).unfocus();

    final bool valid = formKey.validate();

    if (!valid) {
      return;
    }

    final String? email = emailKey.value;
    final String? password = passwordKey.value;

    Navigator.of(context).push(
      ExampleSignupFormDialog(
        email: email ?? '',
        password: password ?? '',
      ),
    );
  }
}
