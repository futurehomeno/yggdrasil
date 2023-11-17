// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'stepper_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class YgStepperTheme extends ThemeExtension<YgStepperTheme> {
  const YgStepperTheme({
    required this.buttonTheme,
    required this.contentPadding,
    required this.metricTextStyle,
    required this.valueTextStyle,
  });

  final YgStepperButtonTheme buttonTheme;
  final EdgeInsets contentPadding;
  final TextStyle metricTextStyle;
  final TextStyle valueTextStyle;

  static final YgStepperTheme consumerLight = YgStepperTheme(
    buttonTheme: _$YgStepperTheme.buttonTheme[0],
    contentPadding: _$YgStepperTheme.contentPadding[0],
    metricTextStyle: _$YgStepperTheme.metricTextStyle[0],
    valueTextStyle: _$YgStepperTheme.valueTextStyle[0],
  );

  static final YgStepperTheme consumerDark = YgStepperTheme(
    buttonTheme: _$YgStepperTheme.buttonTheme[1],
    contentPadding: _$YgStepperTheme.contentPadding[1],
    metricTextStyle: _$YgStepperTheme.metricTextStyle[1],
    valueTextStyle: _$YgStepperTheme.valueTextStyle[1],
  );

  static final YgStepperTheme professionalLight = YgStepperTheme(
    buttonTheme: _$YgStepperTheme.buttonTheme[2],
    contentPadding: _$YgStepperTheme.contentPadding[2],
    metricTextStyle: _$YgStepperTheme.metricTextStyle[2],
    valueTextStyle: _$YgStepperTheme.valueTextStyle[2],
  );

  static final YgStepperTheme professionalDark = YgStepperTheme(
    buttonTheme: _$YgStepperTheme.buttonTheme[3],
    contentPadding: _$YgStepperTheme.contentPadding[3],
    metricTextStyle: _$YgStepperTheme.metricTextStyle[3],
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
    YgStepperButtonTheme? buttonTheme,
    EdgeInsets? contentPadding,
    TextStyle? metricTextStyle,
    TextStyle? valueTextStyle,
  }) {
    return YgStepperTheme(
      buttonTheme: buttonTheme ?? this.buttonTheme,
      contentPadding: contentPadding ?? this.contentPadding,
      metricTextStyle: metricTextStyle ?? this.metricTextStyle,
      valueTextStyle: valueTextStyle ?? this.valueTextStyle,
    );
  }

  @override
  YgStepperTheme lerp(
      covariant ThemeExtension<YgStepperTheme>? other, double t) {
    if (other is! YgStepperTheme) return this as YgStepperTheme;
    return YgStepperTheme(
      buttonTheme:
          buttonTheme.lerp(other.buttonTheme, t) as YgStepperButtonTheme,
      contentPadding: t < 0.5 ? contentPadding : other.contentPadding,
      metricTextStyle:
          TextStyle.lerp(metricTextStyle, other.metricTextStyle, t)!,
      valueTextStyle: TextStyle.lerp(valueTextStyle, other.valueTextStyle, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is YgStepperTheme &&
            const DeepCollectionEquality()
                .equals(buttonTheme, other.buttonTheme) &&
            const DeepCollectionEquality()
                .equals(contentPadding, other.contentPadding) &&
            const DeepCollectionEquality()
                .equals(metricTextStyle, other.metricTextStyle) &&
            const DeepCollectionEquality()
                .equals(valueTextStyle, other.valueTextStyle));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(buttonTheme),
      const DeepCollectionEquality().hash(contentPadding),
      const DeepCollectionEquality().hash(metricTextStyle),
      const DeepCollectionEquality().hash(valueTextStyle),
    );
  }
}
