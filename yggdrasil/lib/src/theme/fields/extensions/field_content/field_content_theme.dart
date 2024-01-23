import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';
import 'package:yggdrasil/src/tokens/consumer_dark/_consumer_dark.dart' as consumer_dark;
import 'package:yggdrasil/src/tokens/consumer_light/_consumer_light.dart' as consumer_light;
import 'package:yggdrasil/src/tokens/professional_dark/_professional_dark.dart' as professional_dark;
import 'package:yggdrasil/src/tokens/professional_light/_professional_light.dart' as professional_light;

part 'field_content_theme.tailor.dart';

@tailorComponent
class _$YgFieldContentTheme {
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

  static const List<Color> cursorColor = <Color>[
    consumer_light.FhColors.textHighlight,
    consumer_dark.FhColors.textHighlight,
    professional_light.FhColors.textHighlight,
    professional_dark.FhColors.textHighlight,
  ];
}
