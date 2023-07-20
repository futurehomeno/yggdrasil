import 'package:flutter/material.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

extension WidgetExtensions on Widget {
  Widget get inspectable {
    return InspectWrapper(
      child: this,
    );
  }
}
