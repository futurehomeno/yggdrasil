// ignore_for_file: always_specify_types

import 'package:flutter/material.dart';

class FhGradients {
  const FhGradients._();

  /// Default color for Dashboard background.
  static const LinearGradient backgroundGradient = LinearGradient(
    begin: Alignment(0.0, 1.0),
    end: Alignment(2.220446049250313e-16, -1.0),
    stops: <double>[
      0.0,
      1.0,
    ],
    colors: <Color>[
      Color(0xfff1f3fa),
      Color(0xffffffff),
    ],
  );

  static const LinearGradient actionPrimaryDefault = LinearGradient(
    begin: Alignment(0.0, 1.0),
    end: Alignment(2.220446049250313e-16, -1.0),
    stops: <double>[
      0.0,
      1.0,
    ],
    colors: <Color>[
      Color(0xff0bf9bd),
      Color(0xff02a8f1),
    ],
  );

  static const LinearGradient actionPrimaryHovered = LinearGradient(
    begin: Alignment(0.0, 1.0),
    end: Alignment(2.220446049250313e-16, -1.0),
    stops: <double>[
      0.0,
      1.0,
    ],
    colors: <Color>[
      Color(0xff05dba6),
      Color(0xff0292d0),
    ],
  );

  static const LinearGradient actionPrimaryPressed = LinearGradient(
    begin: Alignment(0.0, 1.0),
    end: Alignment(2.220446049250313e-16, -1.0),
    stops: <double>[
      0.0,
      1.0,
    ],
    colors: <Color>[
      Color(0xff05dba6),
      Color(0xff0292d0),
    ],
  );

  static const LinearGradient actionPrimarySelected = LinearGradient(
    begin: Alignment(0.0, 1.0),
    end: Alignment(2.220446049250313e-16, -1.0),
    stops: <double>[
      0.0,
      1.0,
    ],
    colors: <Color>[
      Color(0xff05c192),
      Color(0xff027cb2),
    ],
  );

  static const LinearGradient actionSecondarySelected = LinearGradient(
    begin: Alignment(0.0, 1.0),
    end: Alignment(2.220446049250313e-16, -1.0),
    stops: <double>[
      0.0,
      1.0,
    ],
    colors: <Color>[
      Color(0xffb35f02),
      Color(0xffae2f05),
    ],
  );

  static const LinearGradient actionSecondaryPressed = LinearGradient(
    begin: Alignment(0.0, 1.0),
    end: Alignment(2.220446049250313e-16, -1.0),
    stops: <double>[
      0.0,
      1.0,
    ],
    colors: <Color>[
      Color(0xffd27102),
      Color(0xffd43a06),
    ],
  );

  static const LinearGradient actionSecondaryHovered = LinearGradient(
    begin: Alignment(0.0, 1.0),
    end: Alignment(2.220446049250313e-16, -1.0),
    stops: <double>[
      0.0,
      1.0,
    ],
    colors: <Color>[
      Color(0xffd27102),
      Color(0xffd43a06),
    ],
  );

  static const LinearGradient actionSecondaryDefault = LinearGradient(
    begin: Alignment(0.0, 1.0),
    end: Alignment(2.220446049250313e-16, -1.0),
    stops: <double>[
      0.0,
      1.0,
    ],
    colors: <Color>[
      Color(0xfff28102),
      Color(0xfff9470b),
    ],
  );
}
