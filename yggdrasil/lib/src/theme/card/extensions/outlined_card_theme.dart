import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';
import 'package:yggdrasil/src/tokens/consumer_dark/_consumer_dark.dart' as consumer_dark;
import 'package:yggdrasil/src/tokens/consumer_light/_consumer_light.dart' as consumer_light;
import 'package:yggdrasil/src/tokens/professional_dark/_professional_dark.dart' as professional_dark;
import 'package:yggdrasil/src/tokens/professional_light/_professional_light.dart' as professional_light;

part 'outlined_card_theme.tailor.dart';

@tailorComponent
class _$OutlinedCardTheme {
  static const List<Color> backgroundColor = <Color>[
    consumer_light.FhColors.backgroundDefault,
    consumer_dark.FhColors.backgroundDefault,
    professional_light.FhColors.backgroundDefault,
    professional_dark.FhColors.backgroundDefault,
  ];

  // TODO(bjhandeland): Use border width token when available.
  static const List<BorderSide> borderSide = <BorderSide>[
    BorderSide(
      color: consumer_light.FhColors.borderDefault,
      width: 1.0,
    ),
    BorderSide(
      color: consumer_light.FhColors.borderDefault,
      width: 1.0,
    ),
    BorderSide(
      color: consumer_light.FhColors.borderDefault,
      width: 1.0,
    ),
    BorderSide(
      color: consumer_light.FhColors.borderDefault,
      width: 1.0,
    ),
  ];
}
