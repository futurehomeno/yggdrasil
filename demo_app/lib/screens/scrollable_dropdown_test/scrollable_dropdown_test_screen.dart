// ignore_for_file: prefer-single-widget-per-file

import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class ScrollableDropdownTestScreen extends StatelessWidget {
  const ScrollableDropdownTestScreen({super.key});

  static const String routeName = 'ScrollableDropdownTestScreen';

  static PageRouteBuilder<Widget> route() {
    return const YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const ScrollableDropdownTestScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const DemoScreen(
      componentName: 'ScrollableDropdownTest',
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 500),
            child: YgSection(
              child: Test(),
            ),
          ),
        ],
      ),
    );
  }
}

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  bool _shown = false;

  @override
  Widget build(BuildContext context) {
    if (_shown) {
      return ScrollableDropdown(
        gap: 5,
        alignment: DropDownAlignment.auto,
        follower: const Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            YgListTile(
              title: 'Result 1',
            ),
            YgListTile(
              title: 'Result 2',
            ),
            YgListTile(
              title: 'Result 3',
            ),
            YgListTile(
              title: 'Result 4',
            ),
          ],
        ),
        target: const YgTextField(
          label: 'Search',
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.done,
          autocorrect: false,
          textCapitalization: TextCapitalization.none,
        ),
      );
    }

    return YgButton(
      child: const Text('Show'),
      onPressed: () => setState(() {
        _shown = true;
      }),
    );
  }
}
