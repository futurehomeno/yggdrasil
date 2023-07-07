// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'badge_themes.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

<<<<<<< HEAD
class YgBadgeThemes extends ThemeExtension<YgBadgeThemes> {
  const YgBadgeThemes({
=======
class YgBadgeTheme extends ThemeExtension<YgBadgeTheme> {
  const YgBadgeTheme({
>>>>>>> main
    required this.borderRadius,
    required this.strongColor,
    required this.strongTextStyle,
    required this.weakColor,
    required this.weakTextStyle,
  });

  final BorderRadius borderRadius;
  final Color strongColor;
  final TextStyle strongTextStyle;
  final Color weakColor;
  final TextStyle weakTextStyle;

<<<<<<< HEAD
  static final YgBadgeThemes consumerLight = YgBadgeThemes(
=======
  static final YgBadgeTheme consumerLight = YgBadgeTheme(
>>>>>>> main
    borderRadius: _$YgBadgeTheme.borderRadius[0],
    strongColor: _$YgBadgeTheme.strongColor[0],
    strongTextStyle: _$YgBadgeTheme.strongTextStyle[0],
    weakColor: _$YgBadgeTheme.weakColor[0],
    weakTextStyle: _$YgBadgeTheme.weakTextStyle[0],
  );

<<<<<<< HEAD
  static final YgBadgeThemes consumerDark = YgBadgeThemes(
=======
  static final YgBadgeTheme consumerDark = YgBadgeTheme(
>>>>>>> main
    borderRadius: _$YgBadgeTheme.borderRadius[1],
    strongColor: _$YgBadgeTheme.strongColor[1],
    strongTextStyle: _$YgBadgeTheme.strongTextStyle[1],
    weakColor: _$YgBadgeTheme.weakColor[1],
    weakTextStyle: _$YgBadgeTheme.weakTextStyle[1],
  );

<<<<<<< HEAD
  static final YgBadgeThemes professionalLight = YgBadgeThemes(
=======
  static final YgBadgeTheme professionalLight = YgBadgeTheme(
>>>>>>> main
    borderRadius: _$YgBadgeTheme.borderRadius[2],
    strongColor: _$YgBadgeTheme.strongColor[2],
    strongTextStyle: _$YgBadgeTheme.strongTextStyle[2],
    weakColor: _$YgBadgeTheme.weakColor[2],
    weakTextStyle: _$YgBadgeTheme.weakTextStyle[2],
  );

<<<<<<< HEAD
  static final YgBadgeThemes professionalDark = YgBadgeThemes(
=======
  static final YgBadgeTheme professionalDark = YgBadgeTheme(
>>>>>>> main
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
<<<<<<< HEAD
  YgBadgeThemes copyWith({
=======
  YgBadgeTheme copyWith({
>>>>>>> main
    BorderRadius? borderRadius,
    Color? strongColor,
    TextStyle? strongTextStyle,
    Color? weakColor,
    TextStyle? weakTextStyle,
  }) {
<<<<<<< HEAD
    return YgBadgeThemes(
=======
    return YgBadgeTheme(
>>>>>>> main
      borderRadius: borderRadius ?? this.borderRadius,
      strongColor: strongColor ?? this.strongColor,
      strongTextStyle: strongTextStyle ?? this.strongTextStyle,
      weakColor: weakColor ?? this.weakColor,
      weakTextStyle: weakTextStyle ?? this.weakTextStyle,
    );
  }

  @override
<<<<<<< HEAD
  YgBadgeThemes lerp(covariant ThemeExtension<YgBadgeThemes>? other, double t) {
    if (other is! YgBadgeThemes) return this as YgBadgeThemes;
    return YgBadgeThemes(
      borderRadius: t < 0.5 ? borderRadius : other.borderRadius,
      strongColor: Color.lerp(strongColor, other.strongColor, t)!,
      strongTextStyle: TextStyle.lerp(strongTextStyle, other.strongTextStyle, t)!,
=======
  YgBadgeTheme lerp(covariant ThemeExtension<YgBadgeTheme>? other, double t) {
    if (other is! YgBadgeTheme) return this as YgBadgeTheme;
    return YgBadgeTheme(
      borderRadius: t < 0.5 ? borderRadius : other.borderRadius,
      strongColor: Color.lerp(strongColor, other.strongColor, t)!,
      strongTextStyle:
          TextStyle.lerp(strongTextStyle, other.strongTextStyle, t)!,
>>>>>>> main
      weakColor: Color.lerp(weakColor, other.weakColor, t)!,
      weakTextStyle: TextStyle.lerp(weakTextStyle, other.weakTextStyle, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
<<<<<<< HEAD
            other is YgBadgeThemes &&
            const DeepCollectionEquality().equals(borderRadius, other.borderRadius) &&
            const DeepCollectionEquality().equals(strongColor, other.strongColor) &&
            const DeepCollectionEquality().equals(strongTextStyle, other.strongTextStyle) &&
            const DeepCollectionEquality().equals(weakColor, other.weakColor) &&
            const DeepCollectionEquality().equals(weakTextStyle, other.weakTextStyle));
=======
            other is YgBadgeTheme &&
            const DeepCollectionEquality()
                .equals(borderRadius, other.borderRadius) &&
            const DeepCollectionEquality()
                .equals(strongColor, other.strongColor) &&
            const DeepCollectionEquality()
                .equals(strongTextStyle, other.strongTextStyle) &&
            const DeepCollectionEquality().equals(weakColor, other.weakColor) &&
            const DeepCollectionEquality()
                .equals(weakTextStyle, other.weakTextStyle));
>>>>>>> main
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(borderRadius),
      const DeepCollectionEquality().hash(strongColor),
      const DeepCollectionEquality().hash(strongTextStyle),
      const DeepCollectionEquality().hash(weakColor),
      const DeepCollectionEquality().hash(weakTextStyle),
    );
  }
}
