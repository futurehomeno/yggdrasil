// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'badge_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class YgBadgeTheme extends ThemeExtension<YgBadgeTheme> {
  const YgBadgeTheme({
    required this.animationCurve,
    required this.animationDuration,
    required this.borderRadius,
    required this.strongColor,
    required this.strongTextStyle,
    required this.weakColor,
    required this.weakTextStyle,
  });

  final Curve animationCurve;
  final Duration animationDuration;
  final BorderRadius borderRadius;
  final Color strongColor;
  final TextStyle strongTextStyle;
  final Color weakColor;
  final TextStyle weakTextStyle;

  static final YgBadgeTheme consumerLight = YgBadgeTheme(
    animationCurve: _$YgBadgeTheme.animationCurve[0],
    animationDuration: _$YgBadgeTheme.animationDuration[0],
    borderRadius: _$YgBadgeTheme.borderRadius[0],
    strongColor: _$YgBadgeTheme.strongColor[0],
    strongTextStyle: _$YgBadgeTheme.strongTextStyle[0],
    weakColor: _$YgBadgeTheme.weakColor[0],
    weakTextStyle: _$YgBadgeTheme.weakTextStyle[0],
  );

  static final YgBadgeTheme consumerDark = YgBadgeTheme(
    animationCurve: _$YgBadgeTheme.animationCurve[1],
    animationDuration: _$YgBadgeTheme.animationDuration[1],
    borderRadius: _$YgBadgeTheme.borderRadius[1],
    strongColor: _$YgBadgeTheme.strongColor[1],
    strongTextStyle: _$YgBadgeTheme.strongTextStyle[1],
    weakColor: _$YgBadgeTheme.weakColor[1],
    weakTextStyle: _$YgBadgeTheme.weakTextStyle[1],
  );

  static final YgBadgeTheme professionalLight = YgBadgeTheme(
    animationCurve: _$YgBadgeTheme.animationCurve[2],
    animationDuration: _$YgBadgeTheme.animationDuration[2],
    borderRadius: _$YgBadgeTheme.borderRadius[2],
    strongColor: _$YgBadgeTheme.strongColor[2],
    strongTextStyle: _$YgBadgeTheme.strongTextStyle[2],
    weakColor: _$YgBadgeTheme.weakColor[2],
    weakTextStyle: _$YgBadgeTheme.weakTextStyle[2],
  );

  static final YgBadgeTheme professionalDark = YgBadgeTheme(
    animationCurve: _$YgBadgeTheme.animationCurve[3],
    animationDuration: _$YgBadgeTheme.animationDuration[3],
    borderRadius: _$YgBadgeTheme.borderRadius[3],
    strongColor: _$YgBadgeTheme.strongColor[3],
    strongTextStyle: _$YgBadgeTheme.strongTextStyle[3],
    weakColor: _$YgBadgeTheme.weakColor[3],
    weakTextStyle: _$YgBadgeTheme.weakTextStyle[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  YgBadgeTheme copyWith({
    Curve? animationCurve,
    Duration? animationDuration,
    BorderRadius? borderRadius,
    Color? strongColor,
    TextStyle? strongTextStyle,
    Color? weakColor,
    TextStyle? weakTextStyle,
  }) {
    return YgBadgeTheme(
      animationCurve: animationCurve ?? this.animationCurve,
      animationDuration: animationDuration ?? this.animationDuration,
      borderRadius: borderRadius ?? this.borderRadius,
      strongColor: strongColor ?? this.strongColor,
      strongTextStyle: strongTextStyle ?? this.strongTextStyle,
      weakColor: weakColor ?? this.weakColor,
      weakTextStyle: weakTextStyle ?? this.weakTextStyle,
    );
  }

  @override
  YgBadgeTheme lerp(covariant ThemeExtension<YgBadgeTheme>? other, double t) {
    if (other is! YgBadgeTheme) return this as YgBadgeTheme;
    return YgBadgeTheme(
      animationCurve: t < 0.5 ? animationCurve : other.animationCurve,
      animationDuration: t < 0.5 ? animationDuration : other.animationDuration,
      borderRadius: t < 0.5 ? borderRadius : other.borderRadius,
      strongColor: Color.lerp(strongColor, other.strongColor, t)!,
      strongTextStyle:
          TextStyle.lerp(strongTextStyle, other.strongTextStyle, t)!,
      weakColor: Color.lerp(weakColor, other.weakColor, t)!,
      weakTextStyle: TextStyle.lerp(weakTextStyle, other.weakTextStyle, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is YgBadgeTheme &&
            const DeepCollectionEquality()
                .equals(animationCurve, other.animationCurve) &&
            const DeepCollectionEquality()
                .equals(animationDuration, other.animationDuration) &&
            const DeepCollectionEquality()
                .equals(borderRadius, other.borderRadius) &&
            const DeepCollectionEquality()
                .equals(strongColor, other.strongColor) &&
            const DeepCollectionEquality()
                .equals(strongTextStyle, other.strongTextStyle) &&
            const DeepCollectionEquality().equals(weakColor, other.weakColor) &&
            const DeepCollectionEquality()
                .equals(weakTextStyle, other.weakTextStyle));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(animationCurve),
      const DeepCollectionEquality().hash(animationDuration),
      const DeepCollectionEquality().hash(borderRadius),
      const DeepCollectionEquality().hash(strongColor),
      const DeepCollectionEquality().hash(strongTextStyle),
      const DeepCollectionEquality().hash(weakColor),
      const DeepCollectionEquality().hash(weakTextStyle),
    );
  }
}
