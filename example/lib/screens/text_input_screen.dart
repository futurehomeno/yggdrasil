import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/yg_route_builder.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class TextInputScreen extends StatefulWidget {
  const TextInputScreen({super.key});

  static const String routeName = 'TextInputScreen';

  static PageRouteBuilder<Widget> route() {
    return YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const TextInputScreen(),
    );
  }

  @override
  State<TextInputScreen> createState() => _TextInputScreenState();
}

class _TextInputScreenState extends State<TextInputScreen> {
  final TextFieldKey key = TextFieldKey();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: YgScreen(
        componentName: 'Text Input',
        componentDesc: 'Text Input',
        scrollable: false,
        supernovaLink: 'Input',
        child: Column(
          children: <Widget>[
            YgTextInput(
              fieldKey: key,
              label: 'Label',
              obscureText: true,
            ),
            YgTextInput(
              fieldKey: key,
              label: 'Label',
              obscureText: true,
              disabled: true,
            ),
            YgTextInput(
              fieldKey: key,
              label: 'Label',
              disabled: true,
            ),
            YgTextInput(
              fieldKey: key,
              label: 'Label',
              initialValue: 'Initial value',
              disabled: true,
            ),
            YgTextInput(
              fieldKey: key,
              label: 'Label',
              obscureText: true,
              outlined: true,
            ),
            YgTextInput(
              fieldKey: key,
              label: 'Label',
              obscureText: true,
              outlined: true,
              disabled: true,
            ),
            YgTextInput(
              fieldKey: key,
              label: 'Label',
              disabled: true,
              outlined: true,
            ),
            YgTextInput(
              fieldKey: key,
              label: 'Label',
              initialValue: 'Initial value',
              disabled: true,
              outlined: true,
            ),
          ],
        ),
      ),
    );
  }
}
