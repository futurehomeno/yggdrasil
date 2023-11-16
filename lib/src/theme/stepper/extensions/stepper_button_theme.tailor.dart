// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'stepper_button_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class YgStepperButtonTheme extends ThemeExtension<YgStepperButtonTheme> {
  const YgStepperButtonTheme({
    required this.borderGradient,
    required this.borderRadius,
    required this.borderWidth,
    required this.disabledBorderGradient,
    required this.disabledIconColor,
    required this.iconColor,
    required this.iconSize,
    required this.padding,
    required this.splashColor,
  });

  final LinearGradient borderGradient;
  final BorderRadius borderRadius;
  final double borderWidth;
  final LinearGradient disabledBorderGradient;
  final Color disabledIconColor;
  final Color iconColor;
  final double iconSize;
  final EdgeInsets padding;
  final Color splashColor;

  static final YgStepperButtonTheme consumerLight = YgStepperButtonTheme(
    borderGradient: _$YgStepperButtonTheme.borderGradient[0],
    borderRadius: _$YgStepperButtonTheme.borderRadius[0],
    borderWidth: _$YgStepperButtonTheme.borderWidth[0],
    disabledBorderGradient: _$YgStepperButtonTheme.disabledBorderGradient[0],
    disabledIconColor: _$YgStepperButtonTheme.disabledIconColor[0],
    iconColor: _$YgStepperButtonTheme.iconColor[0],
    iconSize: _$YgStepperButtonTheme.iconSize[0],
    padding: _$YgStepperButtonTheme.padding[0],
    splashColor: _$YgStepperButtonTheme.splashColor[0],
  );

  static final YgStepperButtonTheme consumerDark = YgStepperButtonTheme(
    borderGradient: _$YgStepperButtonTheme.borderGradient[1],
    borderRadius: _$YgStepperButtonTheme.borderRadius[1],
    borderWidth: _$YgStepperButtonTheme.borderWidth[1],
    disabledBorderGradient: _$YgStepperButtonTheme.disabledBorderGradient[1],
    disabledIconColor: _$YgStepperButtonTheme.disabledIconColor[1],
    iconColor: _$YgStepperButtonTheme.iconColor[1],
    iconSize: _$YgStepperButtonTheme.iconSize[1],
    padding: _$YgStepperButtonTheme.padding[1],
    splashColor: _$YgStepperButtonTheme.splashColor[1],
  );

  static final YgStepperButtonTheme professionalLight = YgStepperButtonTheme(
    borderGradient: _$YgStepperButtonTheme.borderGradient[2],
    borderRadius: _$YgStepperButtonTheme.borderRadius[2],
    borderWidth: _$YgStepperButtonTheme.borderWidth[2],
    disabledBorderGradient: _$YgStepperButtonTheme.disabledBorderGradient[2],
    disabledIconColor: _$YgStepperButtonTheme.disabledIconColor[2],
    iconColor: _$YgStepperButtonTheme.iconColor[2],
    iconSize: _$YgStepperButtonTheme.iconSize[2],
    padding: _$YgStepperButtonTheme.padding[2],
    splashColor: _$YgStepperButtonTheme.splashColor[2],
  );

  static final YgStepperButtonTheme professionalDark = YgStepperButtonTheme(
    borderGradient: _$YgStepperButtonTheme.borderGradient[3],
    borderRadius: _$YgStepperButtonTheme.borderRadius[3],
    borderWidth: _$YgStepperButtonTheme.borderWidth[3],
    disabledBorderGradient: _$YgStepperButtonTheme.disabledBorderGradient[3],
    disabledIconColor: _$YgStepperButtonTheme.disabledIconColor[3],
    iconColor: _$YgStepperButtonTheme.iconColor[3],
    iconSize: _$YgStepperButtonTheme.iconSize[3],
    padding: _$YgStepperButtonTheme.padding[3],
    splashColor: _$YgStepperButtonTheme.splashColor[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  YgStepperButtonTheme copyWith({
    LinearGradient? borderGradient,
    BorderRadius? borderRadius,
    double? borderWidth,
    LinearGradient? disabledBorderGradient,
    Color? disabledIconColor,
    Color? iconColor,
    double? iconSize,
    EdgeInsets? padding,
    Color? splashColor,
  }) {
    return YgStepperButtonTheme(
      borderGradient: borderGradient ?? this.borderGradient,
      borderRadius: borderRadius ?? this.borderRadius,
      borderWidth: borderWidth ?? this.borderWidth,
      disabledBorderGradient:
          disabledBorderGradient ?? this.disabledBorderGradient,
      disabledIconColor: disabledIconColor ?? this.disabledIconColor,
      iconColor: iconColor ?? this.iconColor,
      iconSize: iconSize ?? this.iconSize,
      padding: padding ?? this.padding,
      splashColor: splashColor ?? this.splashColor,
    );
  }

  @override
  YgStepperButtonTheme lerp(
      covariant ThemeExtension<YgStepperButtonTheme>? other, double t) {
    if (other is! YgStepperButtonTheme) return this as YgStepperButtonTheme;
    return YgStepperButtonTheme(
      borderGradient: t < 0.5 ? borderGradient : other.borderGradient,
      borderRadius: t < 0.5 ? borderRadius : other.borderRadius,
      borderWidth: t < 0.5 ? borderWidth : other.borderWidth,
      disabledBorderGradient:
          t < 0.5 ? disabledBorderGradient : other.disabledBorderGradient,
      disabledIconColor:
          Color.lerp(disabledIconColor, other.disabledIconColor, t)!,
      iconColor: Color.lerp(iconColor, other.iconColor, t)!,
      iconSize: t < 0.5 ? iconSize : other.iconSize,
      padding: t < 0.5 ? padding : other.padding,
      splashColor: Color.lerp(splashColor, other.splashColor, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is YgStepperButtonTheme &&
            const DeepCollectionEquality()
                .equals(borderGradient, other.borderGradient) &&
            const DeepCollectionEquality()
                .equals(borderRadius, other.borderRadius) &&
            const DeepCollectionEquality()
                .equals(borderWidth, other.borderWidth) &&
            const DeepCollectionEquality()
                .equals(disabledBorderGradient, other.disabledBorderGradient) &&
            const DeepCollectionEquality()
                .equals(disabledIconColor, other.disabledIconColor) &&
            const DeepCollectionEquality().equals(iconColor, other.iconColor) &&
            const DeepCollectionEquality().equals(iconSize, other.iconSize) &&
            const DeepCollectionEquality().equals(padding, other.padding) &&
            const DeepCollectionEquality()
                .equals(splashColor, other.splashColor));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(borderGradient),
      const DeepCollectionEquality().hash(borderRadius),
      const DeepCollectionEquality().hash(borderWidth),
      const DeepCollectionEquality().hash(disabledBorderGradient),
      const DeepCollectionEquality().hash(disabledIconColor),
      const DeepCollectionEquality().hash(iconColor),
      const DeepCollectionEquality().hash(iconSize),
      const DeepCollectionEquality().hash(padding),
      const DeepCollectionEquality().hash(splashColor),
    );
  }
}
