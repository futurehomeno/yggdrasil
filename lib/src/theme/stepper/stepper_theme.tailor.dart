// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'stepper_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class YgStepperTheme extends ThemeExtension<YgStepperTheme> {
  const YgStepperTheme({
    required this.animationCurve,
    required this.animationDuration,
    required this.height,
    required this.metricTextStyle,
    required this.textDefaultColor,
    required this.textDisabledColor,
    required this.valueTextStyle,
  });

  final Curve animationCurve;
  final Duration animationDuration;
  final double height;
  final TextStyle metricTextStyle;
  final Color textDefaultColor;
  final Color textDisabledColor;
  final TextStyle valueTextStyle;

  static final YgStepperTheme consumerLight = YgStepperTheme(
    animationCurve: _$YgStepperTheme.animationCurve[0],
    animationDuration: _$YgStepperTheme.animationDuration[0],
    height: _$YgStepperTheme.height[0],
    metricTextStyle: _$YgStepperTheme.metricTextStyle[0],
    textDefaultColor: _$YgStepperTheme.textDefaultColor[0],
    textDisabledColor: _$YgStepperTheme.textDisabledColor[0],
    valueTextStyle: _$YgStepperTheme.valueTextStyle[0],
  );

  static final YgStepperTheme consumerDark = YgStepperTheme(
    animationCurve: _$YgStepperTheme.animationCurve[1],
    animationDuration: _$YgStepperTheme.animationDuration[1],
    height: _$YgStepperTheme.height[1],
    metricTextStyle: _$YgStepperTheme.metricTextStyle[1],
    textDefaultColor: _$YgStepperTheme.textDefaultColor[1],
    textDisabledColor: _$YgStepperTheme.textDisabledColor[1],
    valueTextStyle: _$YgStepperTheme.valueTextStyle[1],
  );

  static final YgStepperTheme professionalLight = YgStepperTheme(
    animationCurve: _$YgStepperTheme.animationCurve[2],
    animationDuration: _$YgStepperTheme.animationDuration[2],
    height: _$YgStepperTheme.height[2],
    metricTextStyle: _$YgStepperTheme.metricTextStyle[2],
    textDefaultColor: _$YgStepperTheme.textDefaultColor[2],
    textDisabledColor: _$YgStepperTheme.textDisabledColor[2],
    valueTextStyle: _$YgStepperTheme.valueTextStyle[2],
  );

  static final YgStepperTheme professionalDark = YgStepperTheme(
    animationCurve: _$YgStepperTheme.animationCurve[3],
    animationDuration: _$YgStepperTheme.animationDuration[3],
    height: _$YgStepperTheme.height[3],
    metricTextStyle: _$YgStepperTheme.metricTextStyle[3],
    textDefaultColor: _$YgStepperTheme.textDefaultColor[3],
    textDisabledColor: _$YgStepperTheme.textDisabledColor[3],
    valueTextStyle: _$YgStepperTheme.valueTextStyle[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  YgStepperTheme copyWith({
    Curve? animationCurve,
    Duration? animationDuration,
    double? height,
    TextStyle? metricTextStyle,
    Color? textDefaultColor,
    Color? textDisabledColor,
    TextStyle? valueTextStyle,
  }) {
    return YgStepperTheme(
      animationCurve: animationCurve ?? this.animationCurve,
      animationDuration: animationDuration ?? this.animationDuration,
      height: height ?? this.height,
      metricTextStyle: metricTextStyle ?? this.metricTextStyle,
      textDefaultColor: textDefaultColor ?? this.textDefaultColor,
      textDisabledColor: textDisabledColor ?? this.textDisabledColor,
      valueTextStyle: valueTextStyle ?? this.valueTextStyle,
    );
  }

  @override
  YgStepperTheme lerp(
      covariant ThemeExtension<YgStepperTheme>? other, double t) {
    if (other is! YgStepperTheme) return this as YgStepperTheme;
    return YgStepperTheme(
      animationCurve: t < 0.5 ? animationCurve : other.animationCurve,
      animationDuration: t < 0.5 ? animationDuration : other.animationDuration,
      height: t < 0.5 ? height : other.height,
      metricTextStyle:
          TextStyle.lerp(metricTextStyle, other.metricTextStyle, t)!,
      textDefaultColor:
          Color.lerp(textDefaultColor, other.textDefaultColor, t)!,
      textDisabledColor:
          Color.lerp(textDisabledColor, other.textDisabledColor, t)!,
      valueTextStyle: TextStyle.lerp(valueTextStyle, other.valueTextStyle, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is YgStepperTheme &&
            const DeepCollectionEquality()
                .equals(animationCurve, other.animationCurve) &&
            const DeepCollectionEquality()
                .equals(animationDuration, other.animationDuration) &&
            const DeepCollectionEquality().equals(height, other.height) &&
            const DeepCollectionEquality()
                .equals(metricTextStyle, other.metricTextStyle) &&
            const DeepCollectionEquality()
                .equals(textDefaultColor, other.textDefaultColor) &&
            const DeepCollectionEquality()
                .equals(textDisabledColor, other.textDisabledColor) &&
            const DeepCollectionEquality()
                .equals(valueTextStyle, other.valueTextStyle));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(animationCurve),
      const DeepCollectionEquality().hash(animationDuration),
      const DeepCollectionEquality().hash(height),
      const DeepCollectionEquality().hash(metricTextStyle),
      const DeepCollectionEquality().hash(textDefaultColor),
      const DeepCollectionEquality().hash(textDisabledColor),
      const DeepCollectionEquality().hash(valueTextStyle),
    );
  }
}
