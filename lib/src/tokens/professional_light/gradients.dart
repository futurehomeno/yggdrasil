// ignore_for_file: always_specify_types

import 'package:flutter/material.dart';

class FhGradients {
  const FhGradients._();

  /// Default color for Dashboard background.
  static const backgroundGradient = LinearGradient(
    begin: Alignment(0, 1),
    end: Alignment(2.220446049250313e-16, -1),
    stops: [
      0,
      1,
    ],
    colors: [
      Color(0xfff1f3fa),
      Color(0xffffffff),
    ],
  );
}
