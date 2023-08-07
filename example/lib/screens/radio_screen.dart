import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class RadioScreen extends StatefulWidget {
  const RadioScreen({super.key});

  static const String routeName = 'RadioScreen';

  static PageRouteBuilder<Widget> route() {
    return YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const RadioScreen(),
    );
  }

  @override
  State<RadioScreen> createState() => _RadioScreenState();
}

class _RadioScreenState extends State<RadioScreen> {
  int groupValue = 1;

  @override
  Widget build(BuildContext context) {
    return DemoScreen(
      componentName: 'Radio',
      componentDesc: 'Radios',
      supernovaLink: 'Link',
      child: Column(
        children: <Widget>[
          const YgListTile(title: 'Radio'),
          YgRadio<int>(
            value: 1,
            groupValue: groupValue,
            onChanged: (int? newValue) {
              groupValue = newValue!;
              setState(() {});
            },
          ),
          YgRadio<int>(
            value: 2,
            groupValue: groupValue,
            onChanged: (int? newValue) {
              groupValue = newValue!;
              setState(() {});
            },
          ),
          YgRadio<int>(
            value: 1,
            groupValue: groupValue,
            onChanged: null,
          ),
          YgRadio<int>(
            value: 2,
            groupValue: groupValue,
            onChanged: null,
          ),
        ],
      ),
    );
  }
}
