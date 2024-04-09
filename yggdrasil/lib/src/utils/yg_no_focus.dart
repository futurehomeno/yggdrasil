import 'package:flutter/material.dart';

class YgNoFocus extends StatelessWidget {
  const YgNoFocus({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Focus(
      autofocus: false,
      canRequestFocus: false,
      descendantsAreFocusable: false,
      descendantsAreTraversable: false,
      child: child,
    );
  }
}
