import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';
import 'package:yggdrasil/src/tokens/consumer_dark/_consumer_dark.dart' as consumer_dark;
import 'package:yggdrasil/src/tokens/consumer_light/_consumer_light.dart' as consumer_light;
import 'package:yggdrasil/src/tokens/professional_dark/_professional_dark.dart' as professional_dark;
import 'package:yggdrasil/src/tokens/professional_light/_professional_light.dart' as professional_light;

part 'text_input_theme.tailor.dart';

@tailorComponent
class _$YgTextInputTheme {
  // region Label

  static const List<Color> labelDefaultColor = <Color>[
    consumer_light.FhColors.textWeak,
    consumer_dark.FhColors.textWeak,
    professional_light.FhColors.textWeak,
    professional_dark.FhColors.textWeak,
  ];

  static const List<Color> labelFocusFilledColor = <Color>[
    consumer_light.FhColors.textDefault,
    consumer_dark.FhColors.textDefault,
    professional_light.FhColors.textDefault,
    professional_dark.FhColors.textDefault,
  ];

  static const List<Color> labelDisabledColor = <Color>[
    consumer_light.FhColors.textDisabled,
    consumer_dark.FhColors.textDisabled,
    professional_light.FhColors.textDisabled,
    professional_dark.FhColors.textDisabled,
  ];

  static List<TextStyle> labelDefaultTextStyle = <TextStyle>[
    consumer_light.FhTextStyles.paragraph2Regular.copyWith(height: 1.25),
    consumer_dark.FhTextStyles.paragraph2Regular.copyWith(height: 1.25),
    professional_light.FhTextStyles.paragraph2Regular.copyWith(height: 1.25),
    professional_dark.FhTextStyles.paragraph2Regular.copyWith(height: 1.25),
  ];

  static const List<TextStyle> labelFocusFilledTextStyle = <TextStyle>[
    consumer_light.FhTextStyles.caption1Medium,
    consumer_dark.FhTextStyles.caption1Medium,
    professional_light.FhTextStyles.caption1Medium,
    professional_dark.FhTextStyles.caption1Medium,
  ];

  // endregion

  // region Placeholder

  static const List<Color> placeholderDefaultColor = <Color>[
    consumer_light.FhColors.textWeak,
    consumer_dark.FhColors.textWeak,
    professional_light.FhColors.textWeak,
    professional_dark.FhColors.textWeak,
  ];

  static const List<Color> placeholderDisabledColor = <Color>[
    consumer_light.FhColors.textDisabled,
    consumer_dark.FhColors.textDisabled,
    professional_light.FhColors.textDisabled,
    professional_dark.FhColors.textDisabled,
  ];

  static List<TextStyle> placeholderTextStyle = <TextStyle>[
    consumer_light.FhTextStyles.paragraph2Regular.copyWith(height: 1.25),
    consumer_dark.FhTextStyles.paragraph2Regular.copyWith(height: 1.25),
    professional_light.FhTextStyles.paragraph2Regular.copyWith(height: 1.25),
    professional_dark.FhTextStyles.paragraph2Regular.copyWith(height: 1.25),
  ];

  // endregion

  // region Border

  static List<Border> borderDefault = <Border>[
    Border.all(
      color: consumer_light.FhColors.borderDefault,
      width: 1,
    ),
    Border.all(
      color: consumer_dark.FhColors.borderDefault,
      width: 1,
    ),
    Border.all(
      color: professional_light.FhColors.borderDefault,
      width: 1,
    ),
    Border.all(
      color: professional_dark.FhColors.borderDefault,
      width: 1,
    ),
  ];

  static List<Border> borderHover = <Border>[
    Border.all(
      color: consumer_light.FhColors.borderWeak,
      width: 1,
    ),
    Border.all(
      color: consumer_dark.FhColors.borderWeak,
      width: 1,
    ),
    Border.all(
      color: professional_light.FhColors.borderWeak,
      width: 1,
    ),
    Border.all(
      color: professional_dark.FhColors.borderWeak,
      width: 1,
    ),
  ];
  static List<Border> borderFocus = <Border>[
    Border.all(
      color: consumer_light.FhColors.interactiveHighlightDefault,
      width: 2,
    ),
    Border.all(
      color: consumer_dark.FhColors.interactiveHighlightDefault,
      width: 2,
    ),
    Border.all(
      color: professional_light.FhColors.interactiveHighlightDefault,
      width: 2,
    ),
    Border.all(
      color: professional_dark.FhColors.interactiveHighlightDefault,
      width: 2,
    ),
  ];
  static List<Border> borderError = <Border>[
    Border.all(
      color: consumer_light.FhColors.interactiveCriticalDefault,
      width: 2,
    ),
    Border.all(
      color: consumer_dark.FhColors.interactiveCriticalDefault,
      width: 2,
    ),
    Border.all(
      color: professional_light.FhColors.interactiveCriticalDefault,
      width: 2,
    ),
    Border.all(
      color: professional_dark.FhColors.interactiveCriticalDefault,
      width: 2,
    ),
  ];
  static List<Border> borderDisabled = <Border>[
    Border.all(
      color: consumer_light.FhColors.borderDisabled,
      width: 1,
    ),
    Border.all(
      color: consumer_dark.FhColors.borderDisabled,
      width: 1,
    ),
    Border.all(
      color: professional_light.FhColors.borderDisabled,
      width: 1,
    ),
    Border.all(
      color: professional_dark.FhColors.borderDisabled,
      width: 1,
    ),
  ];

  static const List<BorderRadius> borderRadius = <BorderRadius>[
    consumer_light.FhRadii.xs,
    consumer_dark.FhRadii.xs,
    professional_light.FhRadii.xs,
    professional_dark.FhRadii.xs,
  ];

  // endregion

  // region Background

  static const List<Color> backgroundDefaultColor = <Color>[
    consumer_light.FhColors.backgroundDefault,
    consumer_dark.FhColors.backgroundDefault,
    professional_light.FhColors.backgroundDefault,
    professional_dark.FhColors.backgroundDefault,
  ];

  static const List<Color> backgroundErrorColor = <Color>[
    consumer_light.FhColors.backgroundCriticalWeak,
    consumer_dark.FhColors.backgroundCriticalWeak,
    professional_light.FhColors.backgroundCriticalWeak,
    professional_dark.FhColors.backgroundCriticalWeak,
  ];
  static const List<Color> backgroundDisabledColor = <Color>[
    consumer_light.FhColors.backgroundDisabled,
    consumer_dark.FhColors.backgroundDisabled,
    professional_light.FhColors.backgroundDisabled,
    professional_dark.FhColors.backgroundDisabled,
  ];

  // endregion

  // region Value

  static const List<Color> valueDefaultColor = <Color>[
    consumer_light.FhColors.textDefault,
    consumer_dark.FhColors.textDefault,
    professional_light.FhColors.textDefault,
    professional_dark.FhColors.textDefault,
  ];

  static const List<Color> valueDisabledColor = <Color>[
    consumer_light.FhColors.textDisabled,
    consumer_dark.FhColors.textDisabled,
    professional_light.FhColors.textDisabled,
    professional_dark.FhColors.textDisabled,
  ];

  static List<TextStyle> valueTextStyle = <TextStyle>[
    consumer_light.FhTextStyles.paragraph2Regular.copyWith(height: 1.25),
    consumer_dark.FhTextStyles.paragraph2Regular.copyWith(height: 1.25),
    professional_light.FhTextStyles.paragraph2Regular.copyWith(height: 1.25),
    professional_dark.FhTextStyles.paragraph2Regular.copyWith(height: 1.25),
  ];

  // endregion

  // region Error Footer

  static List<TextStyle> errorTextStyle = <TextStyle>[
    consumer_light.FhTextStyles.caption1Regular.copyWith(
      color: consumer_light.FhColors.textCritical,
    ),
    consumer_dark.FhTextStyles.caption1Regular.copyWith(
      color: consumer_dark.FhColors.textCritical,
    ),
    professional_light.FhTextStyles.caption1Regular.copyWith(
      color: professional_light.FhColors.textCritical,
    ),
    professional_dark.FhTextStyles.caption1Regular.copyWith(
      color: professional_dark.FhColors.textCritical,
    ),
  ];

  static const List<Color> errorIconColor = <Color>[
    consumer_light.FhColors.iconCritical,
    consumer_dark.FhColors.iconCritical,
    professional_light.FhColors.iconCritical,
    professional_dark.FhColors.iconCritical,
  ];

  // endregion

  static const List<Color> cursorColor = <Color>[
    consumer_light.FhColors.textHighlight,
    consumer_dark.FhColors.textHighlight,
    professional_light.FhColors.textHighlight,
    professional_dark.FhColors.textHighlight,
  ];

  static List<Duration> animationDuration = <Duration>[
    const Duration(milliseconds: 200),
    const Duration(milliseconds: 200),
    const Duration(milliseconds: 200),
    const Duration(milliseconds: 200),
  ];

  static List<Curve> animationCurve = <Curve>[
    const Cubic(0.42, 0, 0.2, 1),
    const Cubic(0.42, 0, 0.2, 1),
    const Cubic(0.42, 0, 0.2, 1),
    const Cubic(0.42, 0, 0.2, 1),
  ];

  static List<double> mediumVerticalContentPadding = <double>[
    consumer_light.FhDimensions.xxs,
    consumer_dark.FhDimensions.xxs,
    professional_light.FhDimensions.xxs,
    professional_dark.FhDimensions.xxs,
  ];

  static List<double> largeVerticalContentPadding = <double>[
    consumer_light.FhDimensions.xs,
    consumer_dark.FhDimensions.xs,
    professional_light.FhDimensions.xs,
    professional_dark.FhDimensions.xs,
  ];

  static List<double> standardHorizontalContentPadding = <double>[
    0,
    0,
    0,
    0,
  ];

  static List<double> outlinedHorizontalContentPadding = <double>[
    consumer_light.FhDimensions.xs,
    consumer_dark.FhDimensions.xs,
    professional_light.FhDimensions.xs,
    professional_dark.FhDimensions.xs,
  ];

  static List<EdgeInsets> outlinedSuffixPadding = <EdgeInsets>[
    const EdgeInsets.symmetric(horizontal: consumer_light.FhDimensions.xxs),
    const EdgeInsets.symmetric(horizontal: consumer_dark.FhDimensions.xxs),
    const EdgeInsets.symmetric(horizontal: professional_light.FhDimensions.xxs),
    const EdgeInsets.symmetric(horizontal: professional_dark.FhDimensions.xxs),
  ];

  static List<EdgeInsets> standardSuffixPadding = <EdgeInsets>[
    const EdgeInsets.only(left: consumer_light.FhDimensions.xxs),
    const EdgeInsets.only(left: consumer_dark.FhDimensions.xxs),
    const EdgeInsets.only(left: professional_light.FhDimensions.xxs),
    const EdgeInsets.only(left: professional_dark.FhDimensions.xxs),
  ];

  // TODO(Tim): Update to using tokens when available.
  static List<EdgeInsets> errorPadding = <EdgeInsets>[
    const EdgeInsets.only(top: 4),
    const EdgeInsets.only(top: 4),
    const EdgeInsets.only(top: 4),
    const EdgeInsets.only(top: 4),
  ];

  // TODO(Tim): Update to using tokens when available.
  static List<EdgeInsets> errorIconPadding = <EdgeInsets>[
    const EdgeInsets.only(right: 4),
    const EdgeInsets.only(right: 4),
    const EdgeInsets.only(right: 4),
    const EdgeInsets.only(right: 4),
  ];
}
