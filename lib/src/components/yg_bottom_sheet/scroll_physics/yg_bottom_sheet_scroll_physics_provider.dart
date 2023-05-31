import 'package:flutter/material.dart';

class YgBottomSheetScrollPhysicsProvider extends InheritedWidget {
  const YgBottomSheetScrollPhysicsProvider({
    required this.scrollPhysics,
    required super.child,
    super.key,
  });

  final ScrollPhysics scrollPhysics;

  @override
  bool updateShouldNotify(covariant YgBottomSheetScrollPhysicsProvider oldWidget) {
    return oldWidget.scrollPhysics != scrollPhysics;
  }
}
