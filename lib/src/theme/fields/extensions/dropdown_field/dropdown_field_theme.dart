import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';
import 'package:yggdrasil/src/tokens/consumer_dark/_consumer_dark.dart' as consumer_dark;
import 'package:yggdrasil/src/tokens/consumer_light/_consumer_light.dart' as consumer_light;
import 'package:yggdrasil/src/tokens/professional_dark/_professional_dark.dart' as professional_dark;
import 'package:yggdrasil/src/tokens/professional_light/_professional_light.dart' as professional_light;

part 'dropdown_field_theme.tailor.dart';

@tailorComponent
class _$YgDropdownFieldTheme {
  static final List<TextStyle> menuItemTitleStyle = <TextStyle>[
    consumer_light.FhTextStyles.pageHeading3Regular.copyWith(
      color: consumer_light.FhColors.textDefault,
    ),
    consumer_dark.FhTextStyles.pageHeading3Regular.copyWith(
      color: consumer_dark.FhColors.textDefault,
    ),
    professional_light.FhTextStyles.pageHeading3Regular.copyWith(
      color: professional_light.FhColors.textDefault,
    ),
    professional_dark.FhTextStyles.pageHeading3Regular.copyWith(
      color: professional_dark.FhColors.textDefault,
    ),
  ];

  static final List<TextStyle> menuItemSubtitleStyle = <TextStyle>[
    consumer_light.FhTextStyles.caption1Regular.copyWith(
      color: consumer_light.FhColors.textWeak,
    ),
    consumer_dark.FhTextStyles.caption1Regular.copyWith(
      color: consumer_dark.FhColors.textWeak,
    ),
    professional_light.FhTextStyles.caption1Regular.copyWith(
      color: professional_light.FhColors.textWeak,
    ),
    professional_dark.FhTextStyles.caption1Regular.copyWith(
      color: professional_dark.FhColors.textWeak,
    ),
  ];

  static final List<EdgeInsets> menuItemPrefixPadding = <EdgeInsets>[
    const EdgeInsets.only(right: consumer_light.FhDimensions.xs),
    const EdgeInsets.only(right: consumer_dark.FhDimensions.xs),
    const EdgeInsets.only(right: professional_light.FhDimensions.xs),
    const EdgeInsets.only(right: professional_dark.FhDimensions.xs),
  ];

  static final List<EdgeInsets> menuItemSuffixPadding = <EdgeInsets>[
    const EdgeInsets.only(left: consumer_light.FhDimensions.xs),
    const EdgeInsets.only(left: consumer_dark.FhDimensions.xs),
    const EdgeInsets.only(left: professional_light.FhDimensions.xs),
    const EdgeInsets.only(left: professional_dark.FhDimensions.xs),
  ];

  static final List<EdgeInsets> menuItemPadding = <EdgeInsets>[
    const EdgeInsets.all(consumer_light.FhDimensions.xs),
    const EdgeInsets.all(consumer_dark.FhDimensions.xs),
    const EdgeInsets.all(professional_light.FhDimensions.xs),
    const EdgeInsets.all(professional_dark.FhDimensions.xs),
  ];

  static final List<Color> menuItemBackground = <Color>[
    consumer_light.FhColors.backgroundDefault,
    consumer_dark.FhColors.backgroundDefault,
    professional_light.FhColors.backgroundDefault,
    professional_dark.FhColors.backgroundDefault,
  ];

  static final List<BorderRadius> menuItemRadius = <BorderRadius>[
    consumer_light.FhRadii.xxs,
    consumer_dark.FhRadii.xxs,
    professional_light.FhRadii.xxs,
    professional_dark.FhRadii.xxs,
  ];

  static final List<BorderRadius> menuRadius = <BorderRadius>[
    consumer_light.FhRadii.xs,
    consumer_dark.FhRadii.xs,
    professional_light.FhRadii.xs,
    professional_dark.FhRadii.xs,
  ];

  static final List<double> menuElevation = <double>[
    consumer_light.FhDimensions.xs,
    consumer_dark.FhDimensions.xs,
    professional_light.FhDimensions.xs,
    professional_dark.FhDimensions.xs,
  ];

  static final List<double> menuToFieldPadding = <double>[
    consumer_light.FhDimensions.xxs,
    consumer_dark.FhDimensions.xxs,
    professional_light.FhDimensions.xxs,
    professional_dark.FhDimensions.xxs,
  ];

  static final List<EdgeInsets> menuPadding = <EdgeInsets>[
    const EdgeInsets.all(consumer_light.FhDimensions.xs),
    const EdgeInsets.all(consumer_dark.FhDimensions.xs),
    const EdgeInsets.all(professional_light.FhDimensions.xs),
    const EdgeInsets.all(professional_dark.FhDimensions.xs),
  ];

  static final List<Curve> menuAnimationCurve = <Curve>[
    Curves.easeOut,
    Curves.easeOut,
    Curves.easeOut,
    Curves.easeOut,
  ];

  static final List<Duration> menuAnimationDuration = <Duration>[
    const Duration(milliseconds: 300),
    const Duration(milliseconds: 300),
    const Duration(milliseconds: 300),
    const Duration(milliseconds: 300),
  ];
}
