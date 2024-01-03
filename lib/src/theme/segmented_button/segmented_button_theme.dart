import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';
import 'package:yggdrasil/src/tokens/consumer_dark/_consumer_dark.dart' as consumer_dark;
import 'package:yggdrasil/src/tokens/consumer_light/_consumer_light.dart' as consumer_light;
import 'package:yggdrasil/src/tokens/professional_dark/_professional_dark.dart' as professional_dark;
import 'package:yggdrasil/src/tokens/professional_light/_professional_light.dart' as professional_light;

part 'segmented_button_theme.tailor.dart';

@tailorComponent
class _$YgSegmentedButtonTheme {
  // region Text

  static const List<TextStyle> textStyle = <TextStyle>[
    consumer_light.FhTextStyles.sectionHeading3Regular,
    consumer_dark.FhTextStyles.sectionHeading3Regular,
    professional_light.FhTextStyles.sectionHeading3Regular,
    professional_dark.FhTextStyles.sectionHeading3Regular,
  ];

  static const List<Color> textDefaultColor = <Color>[
    consumer_light.FhColors.textDefault,
    consumer_dark.FhColors.textDefault,
    professional_light.FhColors.textDefault,
    professional_dark.FhColors.textDefault,
  ];

  static const List<Color> textSelectedColor = <Color>[
    consumer_light.FhColors.textInverse,
    consumer_dark.FhColors.textInverse,
    professional_light.FhColors.textInverse,
    professional_dark.FhColors.textInverse,
  ];

  static const List<Color> textDisabledColor = <Color>[
    consumer_light.FhColors.textDisabled,
    consumer_dark.FhColors.textDisabled,
    professional_light.FhColors.textDisabled,
    professional_dark.FhColors.textDisabled,
  ];

  // endregion

  // region Color

  static const List<Color> backgroundDefaultColor = <Color>[
    consumer_light.FhColors.backgroundWeak,
    consumer_dark.FhColors.backgroundWeak,
    professional_light.FhColors.backgroundWeak,
    professional_dark.FhColors.backgroundWeak,
  ];

  static const List<Color> backgroundSelectedColor = <Color>[
    consumer_light.FhColors.backgroundInverse,
    consumer_dark.FhColors.backgroundInverse,
    professional_light.FhColors.backgroundInverse,
    professional_dark.FhColors.backgroundInverse,
  ];

  static const List<Color> backgroundDisabledColor = <Color>[
    consumer_light.FhColors.backgroundDefault,
    consumer_dark.FhColors.backgroundDefault,
    professional_light.FhColors.backgroundDefault,
    professional_dark.FhColors.backgroundDefault,
  ];

  static const List<Color> backgroundSelectedDisabledColor = <Color>[
    consumer_light.FhColors.backgroundDisabled,
    consumer_dark.FhColors.backgroundDisabled,
    professional_light.FhColors.backgroundDisabled,
    professional_dark.FhColors.backgroundDisabled,
  ];

  // endregion

  // region Icon

  static const List<Color> iconDefaultColor = <Color>[
    consumer_light.FhColors.iconDefault,
    consumer_dark.FhColors.iconDefault,
    professional_light.FhColors.iconDefault,
    professional_dark.FhColors.iconDefault,
  ];

  static const List<Color> iconSelectedColor = <Color>[
    consumer_light.FhColors.iconInverse,
    consumer_dark.FhColors.iconInverse,
    professional_light.FhColors.iconInverse,
    professional_dark.FhColors.iconInverse,
  ];

  static const List<Color> iconDisabledColor = <Color>[
    consumer_light.FhColors.iconDisabled,
    consumer_dark.FhColors.iconDisabled,
    professional_light.FhColors.iconDisabled,
    professional_dark.FhColors.iconDisabled,
  ];

  static const List<double> iconSize = <double>[
    consumer_light.FhDimensions.sm,
    consumer_dark.FhDimensions.sm,
    professional_light.FhDimensions.sm,
    professional_dark.FhDimensions.sm,
  ];

  // endregion

  // region Border

  static const List<BorderRadius> borderRadius = <BorderRadius>[
    consumer_light.FhRadii.xxl,
    consumer_dark.FhRadii.xxl,
    professional_light.FhRadii.xxl,
    professional_dark.FhRadii.xxl,
  ];

  static const List<BorderSide> borderSide = <BorderSide>[
    BorderSide(color: consumer_light.FhColors.borderDefault),
    BorderSide(color: consumer_dark.FhColors.borderDefault),
    BorderSide(color: professional_light.FhColors.borderDefault),
    BorderSide(color: professional_dark.FhColors.borderDefault),
  ];

  // endregion

  static const List<EdgeInsets> padding = <EdgeInsets>[
    EdgeInsets.all(consumer_light.FhDimensions.xxs),
    EdgeInsets.all(consumer_dark.FhDimensions.xxs),
    EdgeInsets.all(professional_light.FhDimensions.xxs),
    EdgeInsets.all(professional_dark.FhDimensions.xxs),
  ];

  static const List<double> childSpacing = <double>[
    consumer_light.FhDimensions.xxs,
    consumer_dark.FhDimensions.xxs,
    professional_light.FhDimensions.xxs,
    professional_dark.FhDimensions.xxs,
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
}
