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
}
