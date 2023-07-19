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
    consumer_light.FhColors.textDefault,
    consumer_dark.FhColors.textDefault,
    professional_light.FhColors.textDefault,
    professional_dark.FhColors.textDefault,
  ];

  static const List<TextStyle> labelDefaultTextStyle = <TextStyle>[
    consumer_light.FhTextStyles.paragraph2Regular,
    consumer_dark.FhTextStyles.paragraph2Regular,
    professional_light.FhTextStyles.paragraph2Regular,
    professional_dark.FhTextStyles.paragraph2Regular,
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

  static const List<TextStyle> placeholderTextStyle = <TextStyle>[
    consumer_light.FhTextStyles.paragraph2Regular,
    consumer_dark.FhTextStyles.paragraph2Regular,
    professional_light.FhTextStyles.paragraph2Regular,
    professional_dark.FhTextStyles.paragraph2Regular,
  ];

  // endregion

  // region Border

  static const List<Color> borderDefaultColor = <Color>[
    consumer_light.FhColors.borderDefault,
    consumer_dark.FhColors.borderDefault,
    professional_light.FhColors.borderDefault,
    professional_dark.FhColors.borderDefault,
  ];

  static const List<Color> borderHoverColor = <Color>[
    consumer_light.FhColors.borderWeak,
    consumer_dark.FhColors.borderWeak,
    professional_light.FhColors.borderWeak,
    professional_dark.FhColors.borderWeak,
  ];
  static const List<Color> borderFocusColor = <Color>[
    consumer_light.FhColors.interactiveHighlightDefault,
    consumer_dark.FhColors.interactiveHighlightDefault,
    professional_light.FhColors.interactiveHighlightDefault,
    professional_dark.FhColors.interactiveHighlightDefault,
  ];
  static const List<Color> borderErrorColor = <Color>[
    consumer_light.FhColors.interactiveCriticalDefault,
    consumer_dark.FhColors.interactiveCriticalDefault,
    professional_light.FhColors.interactiveCriticalDefault,
    professional_dark.FhColors.interactiveCriticalDefault,
  ];
  static const List<Color> borderDisabledColor = <Color>[
    consumer_light.FhColors.borderDisabled,
    consumer_dark.FhColors.borderDisabled,
    professional_light.FhColors.borderDisabled,
    professional_dark.FhColors.borderDisabled,
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

  // region Placeholder

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

  static const List<TextStyle> valueTextStyle = <TextStyle>[
    consumer_light.FhTextStyles.paragraph2Regular,
    consumer_dark.FhTextStyles.paragraph2Regular,
    professional_light.FhTextStyles.paragraph2Regular,
    professional_dark.FhTextStyles.paragraph2Regular,
  ];

  // endregion

  static const List<Color> disabledBorderColor = <Color>[
    consumer_light.FhColors.borderDefault,
    consumer_dark.FhColors.borderDefault,
    professional_light.FhColors.borderDefault,
    professional_dark.FhColors.borderDefault,
  ];

  static const List<Color> disabledOutlineBackgroundColor = <Color>[
    consumer_light.FhColors.backgroundDefault,
    consumer_dark.FhColors.backgroundDefault,
    professional_light.FhColors.backgroundDefault,
    professional_dark.FhColors.backgroundDefault,
  ];

  static const List<Color> disabledLabelColor = <Color>[
    consumer_light.FhColors.textWeak,
    consumer_dark.FhColors.textWeak,
    professional_light.FhColors.textWeak,
    professional_dark.FhColors.textWeak,
  ];

  static const List<double> disabledBorderSize = <double>[
    1,
    1,
    1,
    1,
  ];

  static const List<Color> disabledPlaceholderColor = <Color>[
    consumer_light.FhColors.textDisabled,
    consumer_dark.FhColors.textDisabled,
    professional_light.FhColors.textDisabled,
    professional_dark.FhColors.textDisabled,
  ];

  // endregion
}
