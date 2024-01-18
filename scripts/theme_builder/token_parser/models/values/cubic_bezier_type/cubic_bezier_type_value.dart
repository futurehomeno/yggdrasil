import 'package:flutter/material.dart';

import '../type_value_or_reference.dart';
import 'cubic_bezier_type.dart';

class CubicBezierTypeValue extends CubicBezierTypeValueOrReference implements TypeValue<Cubic> {
  const CubicBezierTypeValue({
    required this.value,
  });

  @override
  final Cubic value;
}
