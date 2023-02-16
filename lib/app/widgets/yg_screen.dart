import 'package:flutter/material.dart';

class YgScreen extends StatelessWidget {
  const YgScreen({
    required this.componentName,
    required this.componentDesc,
    required this.supernovaLink,
    required this.child,
    super.key,
  });

  final String componentName;
  final String componentDesc;
  final String supernovaLink;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: child,
      ),
    );
  }
}
