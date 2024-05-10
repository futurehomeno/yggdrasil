import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class PulseScreen extends StatefulWidget {
  const PulseScreen({super.key});

  static const String routeName = 'PulseScreen';

  static PageRouteBuilder<Widget> route() {
    return const YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const PulseScreen(),
    );
  }

  @override
  State<PulseScreen> createState() => _PulseScreenState();
}

class _PulseScreenState extends State<PulseScreen> {
  bool disabled = false;

  @override
  Widget build(BuildContext context) {
    return DemoScreen(
      componentName: 'Pulse',
      child: Column(
        children: <Widget>[
          YgSection.column(
            title: 'Default pulse widget',
            children: <Widget>[
              YgPulse(disabled: disabled),
              YgButton(
                child: const Text('Toggle'),
                onPressed: () => setState(() => disabled ^= true),
              ),
            ].withVerticalSpacing(20),
          ),
        ],
      ),
    );
  }
}
