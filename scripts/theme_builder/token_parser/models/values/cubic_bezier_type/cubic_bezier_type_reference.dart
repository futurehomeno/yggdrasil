import 'package:flutter/material.dart';

import '../type_value_or_reference.dart';
import 'cubic_bezier_type.dart';

class CubicBezierTypeReference extends CubicBezierTypeValueOrReference implements TypeReference<Cubic> {
  const CubicBezierTypeReference({
    required this.path,
  });

  @override
  final List<String> path;
}
