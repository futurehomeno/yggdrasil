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
    required this.buttonTheme,
    required this.contentPadding,
    required this.metricTextStyle,
    required this.textDisabledColor,
    required this.valueTextStyle,
  });

  final Curve animationCurve;
  final Duration animationDuration;
  final YgStepperButtonTheme buttonTheme;
  final EdgeInsets contentPadding;
  final TextStyle metricTextStyle;
  final Color textDisabledColor;
  final TextStyle valueTextStyle;

  static final YgStepperTheme consumerLight = YgStepperTheme(
    animationCurve: _$YgStepperTheme.animationCurve[0],
    animationDuration: _$YgStepperTheme.animationDuration[0],
    buttonTheme: _$YgStepperTheme.buttonTheme[0],
    contentPadding: _$YgStepperTheme.contentPadding[0],
    metricTextStyle: _$YgStepperTheme.metricTextStyle[0],
    textDisabledColor: _$YgStepperTheme.textDisabledColor[0],
    valueTextStyle: _$YgStepperTheme.valueTextStyle[0],
  );

  static final YgStepperTheme consumerDark = YgStepperTheme(
    animationCurve: _$YgStepperTheme.animationCurve[1],
    animationDuration: _$YgStepperTheme.animationDuration[1],
    buttonTheme: _$YgStepperTheme.buttonTheme[1],
    contentPadding: _$YgStepperTheme.contentPadding[1],
    metricTextStyle: _$YgStepperTheme.metricTextStyle[1],
    textDisabledColor: _$YgStepperTheme.textDisabledColor[1],
    valueTextStyle: _$YgStepperTheme.valueTextStyle[1],
  );

  static final YgStepperTheme professionalLight = YgStepperTheme(
    animationCurve: _$YgStepperTheme.animationCurve[2],
    animationDuration: _$YgStepperTheme.animationDuration[2],
    buttonTheme: _$YgStepperTheme.buttonTheme[2],
    contentPadding: _$YgStepperTheme.contentPadding[2],
    metricTextStyle: _$YgStepperTheme.metricTextStyle[2],
    textDisabledColor: _$YgStepperTheme.textDisabledColor[2],
    valueTextStyle: _$YgStepperTheme.valueTextStyle[2],
  );

  static final YgStepperTheme professionalDark = YgStepperTheme(
    animationCurve: _$YgStepperTheme.animationCurve[3],
    animationDuration: _$YgStepperTheme.animationDuration[3],
    buttonTheme: _$YgStepperTheme.buttonTheme[3],
    contentPadding: _$YgStepperTheme.contentPadding[3],
    metricTextStyle: _$YgStepperTheme.metricTextStyle[3],
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
    YgStepperButtonTheme? buttonTheme,
    EdgeInsets? contentPadding,
    TextStyle? metricTextStyle,
    Color? textDisabledColor,
    TextStyle? valueTextStyle,
  }) {
    return YgStepperTheme(
      animationCurve: animationCurve ?? this.animationCurve,
      animationDuration: animationDuration ?? this.animationDuration,
      buttonTheme: buttonTheme ?? this.buttonTheme,
      contentPadding: contentPadding ?? this.contentPadding,
      metricTextStyle: metricTextStyle ?? this.metricTextStyle,
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
      buttonTheme:
          buttonTheme.lerp(other.buttonTheme, t) as YgStepperButtonTheme,
      contentPadding: t < 0.5 ? contentPadding : other.contentPadding,
      metricTextStyle:
          TextStyle.lerp(metricTextStyle, other.metricTextStyle, t)!,
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
            const DeepCollectionEquality()
                .equals(buttonTheme, other.buttonTheme) &&
            const DeepCollectionEquality()
                .equals(contentPadding, other.contentPadding) &&
            const DeepCollectionEquality()
                .equals(metricTextStyle, other.metricTextStyle) &&
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
      const DeepCollectionEquality().hash(buttonTheme),
      const DeepCollectionEquality().hash(contentPadding),
      const DeepCollectionEquality().hash(metricTextStyle),
      const DeepCollectionEquality().hash(textDisabledColor),
      const DeepCollectionEquality().hash(valueTextStyle),
    );
  }
}
