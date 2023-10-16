import 'package:flutter/material.dart';

class YgScenarioWidgetWrapper extends StatelessWidget {
  const YgScenarioWidgetWrapper({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: child);
  }
}
