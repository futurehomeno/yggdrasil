import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';
import 'package:yggdrasil/src/tokens/consumer_dark/_consumer_dark.dart' as consumer_dark;
import 'package:yggdrasil/src/tokens/consumer_light/_consumer_light.dart' as consumer_light;
import 'package:yggdrasil/src/tokens/professional_dark/_professional_dark.dart' as professional_dark;
import 'package:yggdrasil/src/tokens/professional_light/_professional_light.dart' as professional_light;

part 'text_field_theme.tailor.dart';

@tailorComponent
class _$YgTextFieldTheme {
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

  // Height had to be adjusted to achieve the correct line height used in the
  // design.
  static final List<TextStyle> labelDefaultTextStyle = <TextStyle>[
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

  // Height had to be adjusted to achieve the correct line height used in the
  // design.
  static final List<TextStyle> placeholderTextStyle = <TextStyle>[
    consumer_light.FhTextStyles.paragraph2Regular.copyWith(height: 1.25),
    consumer_dark.FhTextStyles.paragraph2Regular.copyWith(height: 1.25),
    professional_light.FhTextStyles.paragraph2Regular.copyWith(height: 1.25),
    professional_dark.FhTextStyles.paragraph2Regular.copyWith(height: 1.25),
  ];

  // endregion

  // region Border

  static final List<Border> borderDefault = <Border>[
    Border.all(color: consumer_light.FhColors.borderDefault),
    Border.all(color: consumer_dark.FhColors.borderDefault),
    Border.all(color: professional_light.FhColors.borderDefault),
    Border.all(color: professional_dark.FhColors.borderDefault),
  ];

  static final List<Border> borderHover = <Border>[
    Border.all(color: consumer_light.FhColors.borderWeak),
    Border.all(color: consumer_dark.FhColors.borderWeak),
    Border.all(color: professional_light.FhColors.borderWeak),
    Border.all(color: professional_dark.FhColors.borderWeak),
  ];

  static final List<Border> borderFocus = <Border>[
    Border.all(
      color: consumer_light.FhColors.interactiveHighlightDefault,
      width: 2.0,
    ),
    Border.all(
      color: consumer_dark.FhColors.interactiveHighlightDefault,
      width: 2.0,
    ),
    Border.all(
      color: professional_light.FhColors.interactiveHighlightDefault,
      width: 2.0,
    ),
    Border.all(
      color: professional_dark.FhColors.interactiveHighlightDefault,
      width: 2.0,
    ),
  ];

  static final List<Border> borderError = <Border>[
    Border.all(
      color: consumer_light.FhColors.interactiveCriticalDefault,
      width: 2.0,
    ),
    Border.all(
      color: consumer_dark.FhColors.interactiveCriticalDefault,
      width: 2.0,
    ),
    Border.all(
      color: professional_light.FhColors.interactiveCriticalDefault,
      width: 2.0,
    ),
    Border.all(
      color: professional_dark.FhColors.interactiveCriticalDefault,
      width: 2.0,
    ),
  ];

  static final List<Border> borderDisabled = <Border>[
    Border.all(color: consumer_light.FhColors.borderDisabled),
    Border.all(color: consumer_dark.FhColors.borderDisabled),
    Border.all(color: professional_light.FhColors.borderDisabled),
    Border.all(color: professional_dark.FhColors.borderDisabled),
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

  // Height had to be adjusted to achieve the correct line height used in the
  // design.
  static final List<TextStyle> valueTextStyle = <TextStyle>[
    consumer_light.FhTextStyles.paragraph2Regular.copyWith(height: 1.25),
    consumer_dark.FhTextStyles.paragraph2Regular.copyWith(height: 1.25),
    professional_light.FhTextStyles.paragraph2Regular.copyWith(height: 1.25),
    professional_dark.FhTextStyles.paragraph2Regular.copyWith(height: 1.25),
  ];

  // endregion

  // region Error Footer

  static final List<TextStyle> errorTextStyle = <TextStyle>[
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

  static const List<Duration> animationDuration = <Duration>[
    Duration(milliseconds: 200),
    Duration(milliseconds: 200),
    Duration(milliseconds: 200),
    Duration(milliseconds: 200),
  ];

  static const List<Curve> animationCurve = <Curve>[
    Cubic(0.42, 0, 0.2, 1),
    Cubic(0.42, 0, 0.2, 1),
    Cubic(0.42, 0, 0.2, 1),
    Cubic(0.42, 0, 0.2, 1),
  ];

  static const List<double> mediumVerticalContentPadding = <double>[
    consumer_light.FhDimensions.xxs,
    consumer_dark.FhDimensions.xxs,
    professional_light.FhDimensions.xxs,
    professional_dark.FhDimensions.xxs,
  ];

  static const List<double> largeVerticalContentPadding = <double>[
    consumer_light.FhDimensions.xs,
    consumer_dark.FhDimensions.xs,
    professional_light.FhDimensions.xs,
    professional_dark.FhDimensions.xs,
  ];

  static const List<double> outlinedHorizontalContentPadding = <double>[
    consumer_light.FhDimensions.xs,
    consumer_dark.FhDimensions.xs,
    professional_light.FhDimensions.xs,
    professional_dark.FhDimensions.xs,
  ];

  static const List<EdgeInsets> outlinedSuffixPadding = <EdgeInsets>[
    EdgeInsets.symmetric(horizontal: consumer_light.FhDimensions.xxs),
    EdgeInsets.symmetric(horizontal: consumer_dark.FhDimensions.xxs),
    EdgeInsets.symmetric(horizontal: professional_light.FhDimensions.xxs),
    EdgeInsets.symmetric(horizontal: professional_dark.FhDimensions.xxs),
  ];

  static const List<EdgeInsets> standardSuffixPadding = <EdgeInsets>[
    EdgeInsets.only(left: consumer_light.FhDimensions.xxs),
    EdgeInsets.only(left: consumer_dark.FhDimensions.xxs),
    EdgeInsets.only(left: professional_light.FhDimensions.xxs),
    EdgeInsets.only(left: professional_dark.FhDimensions.xxs),
  ];

  static const List<EdgeInsets> errorPadding = <EdgeInsets>[
    EdgeInsets.only(top: consumer_light.FhDimensions.xxs),
    EdgeInsets.only(top: consumer_dark.FhDimensions.xxs),
    EdgeInsets.only(top: professional_light.FhDimensions.xxs),
    EdgeInsets.only(top: professional_dark.FhDimensions.xxs),
  ];

  static const List<EdgeInsets> errorIconPadding = <EdgeInsets>[
    EdgeInsets.only(right: consumer_light.FhDimensions.xxs),
    EdgeInsets.only(right: consumer_dark.FhDimensions.xxs),
    EdgeInsets.only(right: professional_light.FhDimensions.xxs),
    EdgeInsets.only(right: professional_dark.FhDimensions.xxs),
  ];
}
