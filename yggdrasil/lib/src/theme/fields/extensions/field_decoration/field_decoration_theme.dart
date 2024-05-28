import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';
import 'package:yggdrasil/src/tokens/consumer_dark/_consumer_dark.dart' as consumer_dark;
import 'package:yggdrasil/src/tokens/consumer_light/_consumer_light.dart' as consumer_light;
import 'package:yggdrasil/src/tokens/professional_dark/_professional_dark.dart' as professional_dark;
import 'package:yggdrasil/src/tokens/professional_light/_professional_light.dart' as professional_light;

part 'field_decoration_theme.tailor.dart';

@tailorComponent
class _$YgFieldDecorationTheme {
  // region Border

  static final List<Border> borderDefault = <Border>[
    const Border.fromBorderSide(
      BorderSide(color: consumer_light.FhColors.borderDefault),
    ),
    const Border.fromBorderSide(
      BorderSide(color: consumer_dark.FhColors.borderDefault),
    ),
    const Border.fromBorderSide(
      BorderSide(color: professional_light.FhColors.borderDefault),
    ),
    const Border.fromBorderSide(
      BorderSide(color: professional_dark.FhColors.borderDefault),
    ),
  ];

  static final List<Border> borderHover = <Border>[
    const Border.fromBorderSide(BorderSide(color: consumer_light.FhColors.borderWeak)),
    const Border.fromBorderSide(BorderSide(color: consumer_dark.FhColors.borderWeak)),
    const Border.fromBorderSide(BorderSide(color: professional_light.FhColors.borderWeak)),
    const Border.fromBorderSide(BorderSide(color: professional_dark.FhColors.borderWeak)),
  ];

  static final List<Border> borderFocus = <Border>[
    const Border.fromBorderSide(BorderSide(
      color: consumer_light.FhColors.interactiveHighlightDefault,
      width: 2.0,
    )),
    const Border.fromBorderSide(BorderSide(
      color: consumer_dark.FhColors.interactiveHighlightDefault,
      width: 2.0,
    )),
    const Border.fromBorderSide(BorderSide(
      color: professional_light.FhColors.interactiveHighlightDefault,
      width: 2.0,
    )),
    const Border.fromBorderSide(BorderSide(
      color: professional_dark.FhColors.interactiveHighlightDefault,
      width: 2.0,
    )),
  ];

  static final List<Border> borderError = <Border>[
    const Border.fromBorderSide(BorderSide(
      color: consumer_light.FhColors.interactiveCriticalDefault,
      width: 2.0,
    )),
    const Border.fromBorderSide(BorderSide(
      color: consumer_dark.FhColors.interactiveCriticalDefault,
      width: 2.0,
    )),
    const Border.fromBorderSide(BorderSide(
      color: professional_light.FhColors.interactiveCriticalDefault,
      width: 2.0,
    )),
    const Border.fromBorderSide(BorderSide(
      color: professional_dark.FhColors.interactiveCriticalDefault,
      width: 2.0,
    )),
  ];

  static final List<Border> borderDisabled = <Border>[
    const Border.fromBorderSide(BorderSide(color: consumer_light.FhColors.borderDisabled)),
    const Border.fromBorderSide(BorderSide(color: consumer_dark.FhColors.borderDisabled)),
    const Border.fromBorderSide(BorderSide(color: professional_light.FhColors.borderDisabled)),
    const Border.fromBorderSide(BorderSide(color: professional_dark.FhColors.borderDisabled)),
  ];

  static final List<BorderRadius> borderRadiusDefault = <BorderRadius>[
    BorderRadius.only(
      topLeft: consumer_light.FhRadii.xs.topLeft,
      topRight: consumer_light.FhRadii.xs.topRight,
    ),
    BorderRadius.only(
      topLeft: consumer_dark.FhRadii.xs.topLeft,
      topRight: consumer_dark.FhRadii.xs.topRight,
    ),
    BorderRadius.only(
      topLeft: professional_light.FhRadii.xs.topLeft,
      topRight: professional_light.FhRadii.xs.topRight,
    ),
    BorderRadius.only(
      topLeft: professional_dark.FhRadii.xs.topLeft,
      topRight: professional_dark.FhRadii.xs.topRight,
    ),
  ];

  static const List<BorderRadius> borderRadiusOutlined = <BorderRadius>[
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

  // endregion

  // region Content

  static const List<EdgeInsets> mediumOutlinedContentPadding = <EdgeInsets>[
    EdgeInsets.symmetric(
      vertical: consumer_light.FhDimensions.xxs,
      horizontal: consumer_light.FhDimensions.xs,
    ),
    EdgeInsets.symmetric(
      vertical: consumer_dark.FhDimensions.xxs,
      horizontal: consumer_dark.FhDimensions.xs,
    ),
    EdgeInsets.symmetric(
      vertical: professional_light.FhDimensions.xxs,
      horizontal: professional_light.FhDimensions.xs,
    ),
    EdgeInsets.symmetric(
      vertical: professional_dark.FhDimensions.xxs,
      horizontal: professional_dark.FhDimensions.xs,
    ),
  ];

  static const List<EdgeInsets> mediumStandardContentPadding = <EdgeInsets>[
    EdgeInsets.symmetric(vertical: consumer_light.FhDimensions.xxs),
    EdgeInsets.symmetric(vertical: consumer_dark.FhDimensions.xxs),
    EdgeInsets.symmetric(vertical: professional_light.FhDimensions.xxs),
    EdgeInsets.symmetric(vertical: professional_dark.FhDimensions.xxs),
  ];

  static const List<EdgeInsets> largeOutlinedContentPadding = <EdgeInsets>[
    EdgeInsets.all(consumer_light.FhDimensions.xs),
    EdgeInsets.all(consumer_dark.FhDimensions.xs),
    EdgeInsets.all(professional_light.FhDimensions.xs),
    EdgeInsets.all(professional_dark.FhDimensions.xs),
  ];

  static const List<EdgeInsets> largeStandardContentPadding = <EdgeInsets>[
    EdgeInsets.symmetric(vertical: consumer_light.FhDimensions.xs),
    EdgeInsets.symmetric(vertical: consumer_dark.FhDimensions.xs),
    EdgeInsets.symmetric(vertical: professional_light.FhDimensions.xs),
    EdgeInsets.symmetric(vertical: professional_dark.FhDimensions.xs),
  ];

  // endregion

  // region Suffix

  static const List<EdgeInsets> standardSuffixPadding = <EdgeInsets>[
    EdgeInsets.only(left: consumer_light.FhDimensions.xxs),
    EdgeInsets.only(left: consumer_dark.FhDimensions.xxs),
    EdgeInsets.only(left: professional_light.FhDimensions.xxs),
    EdgeInsets.only(left: professional_dark.FhDimensions.xxs),
  ];

  static const List<EdgeInsets> outlinedSuffixPadding = <EdgeInsets>[
    EdgeInsets.only(left: consumer_light.FhDimensions.xxs),
    EdgeInsets.only(left: consumer_dark.FhDimensions.xxs),
    EdgeInsets.only(left: professional_light.FhDimensions.xxs),
    EdgeInsets.only(left: professional_dark.FhDimensions.xxs),
  ];

  // endregion
}
