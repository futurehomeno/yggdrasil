// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'badge_themes.dart';

// **************************************************************************
// ThemeTailorGenerator
// **************************************************************************

class YgBadgeTheme extends ThemeExtension<YgBadgeTheme> {
  const YgBadgeTheme({
    required this.weakTextStyle,
    required this.strongTextStyle,
    required this.weakColor,
    required this.strongColor,
    required this.borderRadius,
  });

  final TextStyle weakTextStyle;
  final TextStyle strongTextStyle;
  final Color weakColor;
  final Color strongColor;
  final BorderRadius borderRadius;

  static final YgBadgeTheme consumerLight = YgBadgeTheme(
    weakTextStyle: _$YgBadgeTheme.weakTextStyle[0],
    strongTextStyle: _$YgBadgeTheme.strongTextStyle[0],
    weakColor: _$YgBadgeTheme.weakColor[0],
    strongColor: _$YgBadgeTheme.strongColor[0],
    borderRadius: _$YgBadgeTheme.borderRadius[0],
  );

  static final YgBadgeTheme consumerDark = YgBadgeTheme(
    weakTextStyle: _$YgBadgeTheme.weakTextStyle[1],
    strongTextStyle: _$YgBadgeTheme.strongTextStyle[1],
    weakColor: _$YgBadgeTheme.weakColor[1],
    strongColor: _$YgBadgeTheme.strongColor[1],
    borderRadius: _$YgBadgeTheme.borderRadius[1],
  );

  static final YgBadgeTheme professionalLight = YgBadgeTheme(
    weakTextStyle: _$YgBadgeTheme.weakTextStyle[2],
    strongTextStyle: _$YgBadgeTheme.strongTextStyle[2],
    weakColor: _$YgBadgeTheme.weakColor[2],
    strongColor: _$YgBadgeTheme.strongColor[2],
    borderRadius: _$YgBadgeTheme.borderRadius[2],
  );

  static final YgBadgeTheme professionalDark = YgBadgeTheme(
    weakTextStyle: _$YgBadgeTheme.weakTextStyle[3],
    strongTextStyle: _$YgBadgeTheme.strongTextStyle[3],
    weakColor: _$YgBadgeTheme.weakColor[3],
    strongColor: _$YgBadgeTheme.strongColor[3],
    borderRadius: _$YgBadgeTheme.borderRadius[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  YgBadgeTheme copyWith({
    TextStyle? weakTextStyle,
    TextStyle? strongTextStyle,
    Color? weakColor,
    Color? strongColor,
    BorderRadius? borderRadius,
  }) {
    return YgBadgeTheme(
      weakTextStyle: weakTextStyle ?? this.weakTextStyle,
      strongTextStyle: strongTextStyle ?? this.strongTextStyle,
      weakColor: weakColor ?? this.weakColor,
      strongColor: strongColor ?? this.strongColor,
      borderRadius: borderRadius ?? this.borderRadius,
    );
  }

  @override
  YgBadgeTheme lerp(ThemeExtension<YgBadgeTheme>? other, double t) {
    if (other is! YgBadgeTheme) return this;
    return YgBadgeTheme(
      weakTextStyle: TextStyle.lerp(weakTextStyle, other.weakTextStyle, t)!,
      strongTextStyle:
          TextStyle.lerp(strongTextStyle, other.strongTextStyle, t)!,
      weakColor: Color.lerp(weakColor, other.weakColor, t)!,
      strongColor: Color.lerp(strongColor, other.strongColor, t)!,
      borderRadius: t < 0.5 ? borderRadius : other.borderRadius,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is YgBadgeTheme &&
            const DeepCollectionEquality()
                .equals(weakTextStyle, other.weakTextStyle) &&
            const DeepCollectionEquality()
                .equals(strongTextStyle, other.strongTextStyle) &&
            const DeepCollectionEquality().equals(weakColor, other.weakColor) &&
            const DeepCollectionEquality()
                .equals(strongColor, other.strongColor) &&
            const DeepCollectionEquality()
                .equals(borderRadius, other.borderRadius));
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType,
        const DeepCollectionEquality().hash(weakTextStyle),
        const DeepCollectionEquality().hash(strongTextStyle),
        const DeepCollectionEquality().hash(weakColor),
        const DeepCollectionEquality().hash(strongColor),
        const DeepCollectionEquality().hash(borderRadius));
  }
}
