import 'package:flutter/material.dart';

class YgBottomSheetScrollPhysicsProvider extends InheritedWidget {
  const YgBottomSheetScrollPhysicsProvider({
    super.key,
    required this.scrollPhysics,
    required super.child,
  });

  final ScrollPhysics scrollPhysics;

  @override
  bool updateShouldNotify(covariant YgBottomSheetScrollPhysicsProvider oldWidget) {
    return oldWidget.scrollPhysics != scrollPhysics;
  }
}
