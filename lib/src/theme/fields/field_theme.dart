import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';
import 'package:yggdrasil/src/theme/fields/_fields.dart';

part 'field_theme.tailor.dart';

@tailorComponent
class _$YgFieldTheme {
  @themeExtension
  static final List<YgFieldDecorationTheme> decorationTheme = YgFieldDecorationTheme.themes;

  @themeExtension
  static final List<YgFieldContentTheme> contentTheme = YgFieldContentTheme.themes;

  @themeExtension
  static final List<YgDropdownFieldTheme> dropdownTheme = YgDropdownFieldTheme.themes;

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
