import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';
import 'package:yggdrasil/src/tokens/consumer_dark/_consumer_dark.dart' as consumer_dark;
import 'package:yggdrasil/src/tokens/consumer_light/_consumer_light.dart' as consumer_light;
import 'package:yggdrasil/src/tokens/professional_dark/_professional_dark.dart' as professional_dark;
import 'package:yggdrasil/src/tokens/professional_light/_professional_light.dart' as professional_light;

part 'yg_gradients.tailor.dart';

@tailorComponent
class _$YgGradient {
  static const List<Gradient> backgroundGradient = <Gradient>[
    consumer_light.FhGradients.backgroundGradient,
    consumer_dark.FhGradients.backgroundGradient,
    professional_light.FhGradients.backgroundGradient,
    professional_dark.FhGradients.backgroundGradient,
  ];
  static const List<Gradient> actionPrimaryDefault = <Gradient>[
    consumer_light.FhGradients.actionPrimaryDefault,
    consumer_dark.FhGradients.actionPrimaryDefault,
    professional_light.FhGradients.actionPrimaryDefault,
    professional_dark.FhGradients.actionPrimaryDefault,
  ];
  static const List<Gradient> actionPrimaryHovered = <Gradient>[
    consumer_light.FhGradients.actionPrimaryHovered,
    consumer_dark.FhGradients.actionPrimaryHovered,
    professional_light.FhGradients.actionPrimaryHovered,
    professional_dark.FhGradients.actionPrimaryHovered,
  ];
  static const List<Gradient> actionPrimaryPressed = <Gradient>[
    consumer_light.FhGradients.actionPrimaryPressed,
    consumer_dark.FhGradients.actionPrimaryPressed,
    professional_light.FhGradients.actionPrimaryPressed,
    professional_dark.FhGradients.actionPrimaryPressed,
  ];
  static const List<Gradient> actionPrimarySelected = <Gradient>[
    consumer_light.FhGradients.actionPrimarySelected,
    consumer_dark.FhGradients.actionPrimarySelected,
    professional_light.FhGradients.actionPrimarySelected,
    professional_dark.FhGradients.actionPrimarySelected,
  ];
  static const List<Gradient> actionSecondarySelected = <Gradient>[
    consumer_light.FhGradients.actionSecondarySelected,
    consumer_dark.FhGradients.actionSecondarySelected,
    professional_light.FhGradients.actionSecondarySelected,
    professional_dark.FhGradients.actionSecondarySelected,
  ];
  static const List<Gradient> actionSecondaryPressed = <Gradient>[
    consumer_light.FhGradients.actionSecondaryPressed,
    consumer_dark.FhGradients.actionSecondaryPressed,
    professional_light.FhGradients.actionSecondaryPressed,
    professional_dark.FhGradients.actionSecondaryPressed,
  ];
  static const List<Gradient> actionSecondaryHovered = <Gradient>[
    consumer_light.FhGradients.actionSecondaryHovered,
    consumer_dark.FhGradients.actionSecondaryHovered,
    professional_light.FhGradients.actionSecondaryHovered,
    professional_dark.FhGradients.actionSecondaryHovered,
  ];
  static const List<Gradient> actionSecondaryDefault = <Gradient>[
    consumer_light.FhGradients.actionSecondaryDefault,
    consumer_dark.FhGradients.actionSecondaryDefault,
    professional_light.FhGradients.actionSecondaryDefault,
    professional_dark.FhGradients.actionSecondaryDefault,
  ];
}
