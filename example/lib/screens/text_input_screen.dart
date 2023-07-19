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
    return YgScreen(
      componentName: 'Text Input',
      componentDesc: 'Text Input',
      scrollable: false,
      supernovaLink: 'Input',
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.red,
            child: YgTextInput(
              fieldKey: key,
              label: 'Label',
              obscureText: true,
            ),
          ),
        ],
      ),
    );
  }
}
