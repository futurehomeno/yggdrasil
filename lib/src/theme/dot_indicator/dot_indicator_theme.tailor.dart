// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'dot_indicator_theme.dart';

// **************************************************************************
// ThemeTailorGenerator
// **************************************************************************

class YgDotIndicatorTheme extends ThemeExtension<YgDotIndicatorTheme> {
  const YgDotIndicatorTheme({
    required this.color,
    required this.borderRadius,
  });

  final Color color;
  final BorderRadius borderRadius;

  static final YgDotIndicatorTheme consumerLight = YgDotIndicatorTheme(
    color: _$YgDotIndicatorTheme.color[0],
    borderRadius: _$YgDotIndicatorTheme.borderRadius[0],
  );

  static final YgDotIndicatorTheme consumerDark = YgDotIndicatorTheme(
    color: _$YgDotIndicatorTheme.color[1],
    borderRadius: _$YgDotIndicatorTheme.borderRadius[1],
  );

  static final YgDotIndicatorTheme professionalLight = YgDotIndicatorTheme(
    color: _$YgDotIndicatorTheme.color[2],
    borderRadius: _$YgDotIndicatorTheme.borderRadius[2],
  );

  static final YgDotIndicatorTheme professionalDark = YgDotIndicatorTheme(
    color: _$YgDotIndicatorTheme.color[3],
    borderRadius: _$YgDotIndicatorTheme.borderRadius[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  YgDotIndicatorTheme copyWith({
    Color? color,
    BorderRadius? borderRadius,
  }) {
    return YgDotIndicatorTheme(
      color: color ?? this.color,
      borderRadius: borderRadius ?? this.borderRadius,
    );
  }

  @override
  YgDotIndicatorTheme lerp(
      ThemeExtension<YgDotIndicatorTheme>? other, double t) {
    if (other is! YgDotIndicatorTheme) return this;
    return YgDotIndicatorTheme(
      color: Color.lerp(color, other.color, t)!,
      borderRadius: t < 0.5 ? borderRadius : other.borderRadius,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is YgDotIndicatorTheme &&
            const DeepCollectionEquality().equals(color, other.color) &&
            const DeepCollectionEquality()
                .equals(borderRadius, other.borderRadius));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, const DeepCollectionEquality().hash(color),
        const DeepCollectionEquality().hash(borderRadius));
  }
}
