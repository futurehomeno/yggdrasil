import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

extension WidgetListExtensions on List<Widget> {
  List<Widget> get inspectable {
    return map(
      (Widget child) => InspectWrapper(
        child: child,
      ),
    ).toList();
  }

  List<Widget> get spaced20 {
    return withVerticalSpacing(20);
  }

  List<Widget> get spaced10 {
    return withVerticalSpacing(10);
  }
}
