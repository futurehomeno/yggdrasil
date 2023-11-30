import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';
import 'package:yggdrasil/src/tokens/consumer_dark/_consumer_dark.dart' as consumer_dark;
import 'package:yggdrasil/src/tokens/consumer_light/_consumer_light.dart' as consumer_light;
import 'package:yggdrasil/src/tokens/professional_dark/_professional_dark.dart' as professional_dark;
import 'package:yggdrasil/src/tokens/professional_light/_professional_light.dart' as professional_light;

import 'extensions/_extensions.dart';

part 'toggle_button_theme.tailor.dart';

@tailorComponent
class _$YgToggleButtonTheme {
  @themeExtension
  static final List<ToggleIconButtonTheme> toggleIconButtonTheme = ToggleIconButtonTheme.themes;

  @themeExtension
  static final List<ToggleTextButtonTheme> toggleTextButtonTheme = ToggleTextButtonTheme.themes;

  @themeExtension
  static final List<ToggleIconTextButtonTheme> toggleIconTextButtonTheme = ToggleIconTextButtonTheme.themes;

  static const List<double> iconDefaultSize = <double>[
    consumer_light.FhDimensions.sm,
    consumer_dark.FhDimensions.sm,
    professional_light.FhDimensions.sm,
    professional_dark.FhDimensions.sm,
  ];

  static const List<double> iconLargeIconOnlySize = <double>[
    consumer_light.FhDimensions.lg,
    consumer_dark.FhDimensions.lg,
    professional_light.FhDimensions.lg,
    professional_dark.FhDimensions.lg,
  ];

  static const List<double> iconTextSpacing = <double>[
    consumer_light.FhDimensions.xxs,
    consumer_dark.FhDimensions.xxs,
    professional_light.FhDimensions.xxs,
    professional_dark.FhDimensions.xxs,
  ];

  static const List<BorderRadius> borderRadius = <BorderRadius>[
    consumer_light.FhRadii.xxl,
    consumer_dark.FhRadii.xxl,
    professional_light.FhRadii.xxl,
    professional_dark.FhRadii.xxl,
  ];

  // region border color

  static const List<Color> borderDefaultColor = <Color>[
    consumer_light.FhColors.borderDefault,
    consumer_dark.FhColors.borderDefault,
    professional_light.FhColors.borderDefault,
    professional_dark.FhColors.borderDefault,
  ];

  static const List<Color> borderToggledColor = <Color>[
    consumer_light.FhColors.borderInverse,
    consumer_dark.FhColors.borderInverse,
    professional_light.FhColors.borderInverse,
    professional_dark.FhColors.borderInverse,
  ];

  static const List<Color> borderToggledDisabledColor = <Color>[
    consumer_light.FhColors.borderDisabled,
    consumer_dark.FhColors.borderDisabled,
    professional_light.FhColors.borderDisabled,
    professional_dark.FhColors.borderDisabled,
  ];

  static const List<Color> borderHoveredFocusedColor = <Color>[
    consumer_light.FhColors.borderWeak,
    consumer_dark.FhColors.borderWeak,
    professional_light.FhColors.borderWeak,
    professional_dark.FhColors.borderWeak,
  ];

  static const List<Color> borderDisabledColor = <Color>[
    consumer_light.FhColors.borderDefault,
    consumer_dark.FhColors.borderDefault,
    professional_light.FhColors.borderDefault,
    professional_dark.FhColors.borderDefault,
  ];

  // endregion

  // region background

  static const List<Color> backgroundToggledColor = <Color>[
    consumer_light.FhColors.backgroundInverse,
    consumer_dark.FhColors.backgroundInverse,
    professional_light.FhColors.backgroundInverse,
    professional_dark.FhColors.backgroundInverse,
  ];

  static const List<Color> backgroundToggledDisabledColor = <Color>[
    consumer_light.FhColors.backgroundDisabled,
    consumer_dark.FhColors.backgroundDisabled,
    professional_light.FhColors.backgroundDisabled,
    professional_dark.FhColors.backgroundDisabled,
  ];

  static const List<Color> backgroundColor = <Color>[
    consumer_light.FhColors.backgroundDefault,
    consumer_dark.FhColors.backgroundDefault,
    professional_light.FhColors.backgroundDefault,
    professional_dark.FhColors.backgroundDefault,
  ];

  static const List<Color> backgroundHoveredFocusedColor = <Color>[
    consumer_light.FhColors.backgroundWeak,
    consumer_dark.FhColors.backgroundWeak,
    professional_light.FhColors.backgroundWeak,
    professional_dark.FhColors.backgroundWeak,
  ];

  // endregion

  // region Icon color

  static const List<Color> iconToggledColor = <Color>[
    consumer_light.FhColors.iconInverse,
    consumer_dark.FhColors.iconInverse,
    professional_light.FhColors.iconInverse,
    professional_dark.FhColors.iconInverse,
  ];

  static const List<Color> iconDefaultColor = <Color>[
    consumer_light.FhColors.iconDefault,
    consumer_dark.FhColors.iconDefault,
    professional_light.FhColors.iconDefault,
    professional_dark.FhColors.iconDefault,
  ];

  static const List<Color> iconDisabledColor = <Color>[
    consumer_light.FhColors.iconDisabled,
    consumer_dark.FhColors.iconDisabled,
    professional_light.FhColors.iconDisabled,
    professional_dark.FhColors.iconDisabled,
  ];

  // endregion

  // region text style

  static const List<TextStyle> textStyleSmall = <TextStyle>[
    consumer_light.FhTextStyles.caption1Bold,
    consumer_dark.FhTextStyles.caption1Bold,
    professional_light.FhTextStyles.caption1Bold,
    professional_dark.FhTextStyles.caption1Bold,
  ];

  static const List<TextStyle> textStyleMedium = <TextStyle>[
    consumer_light.FhTextStyles.paragraph3Bold,
    consumer_dark.FhTextStyles.paragraph3Bold,
    professional_light.FhTextStyles.paragraph3Bold,
    professional_dark.FhTextStyles.paragraph3Bold,
  ];

  static const List<TextStyle> textStyleLarge = <TextStyle>[
    consumer_light.FhTextStyles.paragraph2Bold,
    consumer_dark.FhTextStyles.paragraph2Bold,
    professional_light.FhTextStyles.paragraph2Bold,
    professional_dark.FhTextStyles.paragraph2Bold,
  ];

  // endregion

  // region Text color

  static const List<Color> textToggledColor = <Color>[
    consumer_light.FhColors.textInverse,
    consumer_dark.FhColors.textInverse,
    professional_light.FhColors.textInverse,
    professional_dark.FhColors.textInverse,
  ];

  static const List<Color> textDefaultColor = <Color>[
    consumer_light.FhColors.textDefault,
    consumer_dark.FhColors.textDefault,
    professional_light.FhColors.textDefault,
    professional_dark.FhColors.textDefault,
  ];

  static const List<Color> textDisabledColor = <Color>[
    consumer_light.FhColors.textDisabled,
    consumer_dark.FhColors.textDisabled,
    professional_light.FhColors.textDisabled,
    professional_dark.FhColors.textDisabled,
  ];

  // endregion

  // TODO(bjhandeland): Replace with theme token.
  static const List<Duration> animationDuration = <Duration>[
    Duration(milliseconds: 120),
    Duration(milliseconds: 120),
    Duration(milliseconds: 120),
    Duration(milliseconds: 120),
  ];

  // TODO(bjhandeland): Replace with theme token.
  static const List<Curve> animationCurve = <Curve>[
    Cubic(0.35, 0.0, 0.1, 1.0),
    Cubic(0.35, 0.0, 0.1, 1.0),
    Cubic(0.35, 0.0, 0.1, 1.0),
    Cubic(0.35, 0.0, 0.1, 1.0),
  ];
}
