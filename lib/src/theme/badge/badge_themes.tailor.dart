// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'badge_themes.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class YgBadgeThemes extends ThemeExtension<YgBadgeThemes> {
  const YgBadgeThemes({
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

  static final YgBadgeThemes consumerLight = YgBadgeThemes(
    borderRadius: _$YgBadgeTheme.borderRadius[0],
    strongColor: _$YgBadgeTheme.strongColor[0],
    strongTextStyle: _$YgBadgeTheme.strongTextStyle[0],
    weakColor: _$YgBadgeTheme.weakColor[0],
    weakTextStyle: _$YgBadgeTheme.weakTextStyle[0],
  );

  static final YgBadgeThemes consumerDark = YgBadgeThemes(
    borderRadius: _$YgBadgeTheme.borderRadius[1],
    strongColor: _$YgBadgeTheme.strongColor[1],
    strongTextStyle: _$YgBadgeTheme.strongTextStyle[1],
    weakColor: _$YgBadgeTheme.weakColor[1],
    weakTextStyle: _$YgBadgeTheme.weakTextStyle[1],
  );

  static final YgBadgeThemes professionalLight = YgBadgeThemes(
    borderRadius: _$YgBadgeTheme.borderRadius[2],
    strongColor: _$YgBadgeTheme.strongColor[2],
    strongTextStyle: _$YgBadgeTheme.strongTextStyle[2],
    weakColor: _$YgBadgeTheme.weakColor[2],
    weakTextStyle: _$YgBadgeTheme.weakTextStyle[2],
  );

  static final YgBadgeThemes professionalDark = YgBadgeThemes(
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
  YgBadgeThemes copyWith({
    BorderRadius? borderRadius,
    Color? strongColor,
    TextStyle? strongTextStyle,
    Color? weakColor,
    TextStyle? weakTextStyle,
  }) {
    return YgBadgeThemes(
      borderRadius: borderRadius ?? this.borderRadius,
      strongColor: strongColor ?? this.strongColor,
      strongTextStyle: strongTextStyle ?? this.strongTextStyle,
      weakColor: weakColor ?? this.weakColor,
      weakTextStyle: weakTextStyle ?? this.weakTextStyle,
    );
  }

  @override
  YgBadgeThemes lerp(covariant ThemeExtension<YgBadgeThemes>? other, double t) {
    if (other is! YgBadgeThemes) return this as YgBadgeThemes;
    return YgBadgeThemes(
      borderRadius: t < 0.5 ? borderRadius : other.borderRadius,
      strongColor: Color.lerp(strongColor, other.strongColor, t)!,
      strongTextStyle: TextStyle.lerp(strongTextStyle, other.strongTextStyle, t)!,
      weakColor: Color.lerp(weakColor, other.weakColor, t)!,
      weakTextStyle: TextStyle.lerp(weakTextStyle, other.weakTextStyle, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is YgBadgeThemes &&
            const DeepCollectionEquality().equals(borderRadius, other.borderRadius) &&
            const DeepCollectionEquality().equals(strongColor, other.strongColor) &&
            const DeepCollectionEquality().equals(strongTextStyle, other.strongTextStyle) &&
            const DeepCollectionEquality().equals(weakColor, other.weakColor) &&
            const DeepCollectionEquality().equals(weakTextStyle, other.weakTextStyle));
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
