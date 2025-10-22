// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'positive_tag_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class YgPositiveTagTheme extends ThemeExtension<YgPositiveTagTheme> {
  const YgPositiveTagTheme({
    required this.backgroundColor,
    required this.disabledBackgroundColor,
    required this.strongBackgroundColor,
  });

  final Color backgroundColor;
  final Color disabledBackgroundColor;
  final Color strongBackgroundColor;

  static final YgPositiveTagTheme consumerLight = YgPositiveTagTheme(
    backgroundColor: _$YgPositiveTagTheme.backgroundColor[0],
    disabledBackgroundColor: _$YgPositiveTagTheme.disabledBackgroundColor[0],
    strongBackgroundColor: _$YgPositiveTagTheme.strongBackgroundColor[0],
  );

  static final YgPositiveTagTheme consumerDark = YgPositiveTagTheme(
    backgroundColor: _$YgPositiveTagTheme.backgroundColor[1],
    disabledBackgroundColor: _$YgPositiveTagTheme.disabledBackgroundColor[1],
    strongBackgroundColor: _$YgPositiveTagTheme.strongBackgroundColor[1],
  );

  static final YgPositiveTagTheme professionalLight = YgPositiveTagTheme(
    backgroundColor: _$YgPositiveTagTheme.backgroundColor[2],
    disabledBackgroundColor: _$YgPositiveTagTheme.disabledBackgroundColor[2],
    strongBackgroundColor: _$YgPositiveTagTheme.strongBackgroundColor[2],
  );

  static final YgPositiveTagTheme professionalDark = YgPositiveTagTheme(
    backgroundColor: _$YgPositiveTagTheme.backgroundColor[3],
    disabledBackgroundColor: _$YgPositiveTagTheme.disabledBackgroundColor[3],
    strongBackgroundColor: _$YgPositiveTagTheme.strongBackgroundColor[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  YgPositiveTagTheme copyWith({
    Color? backgroundColor,
    Color? disabledBackgroundColor,
    Color? strongBackgroundColor,
  }) {
    return YgPositiveTagTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      disabledBackgroundColor: disabledBackgroundColor ?? this.disabledBackgroundColor,
      strongBackgroundColor: strongBackgroundColor ?? this.strongBackgroundColor,
    );
  }

  @override
  YgPositiveTagTheme lerp(covariant ThemeExtension<YgPositiveTagTheme>? other, double t) {
    if (other is! YgPositiveTagTheme) return this as YgPositiveTagTheme;
    return YgPositiveTagTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      disabledBackgroundColor: Color.lerp(disabledBackgroundColor, other.disabledBackgroundColor, t)!,
      strongBackgroundColor: Color.lerp(strongBackgroundColor, other.strongBackgroundColor, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is YgPositiveTagTheme &&
            const DeepCollectionEquality().equals(backgroundColor, other.backgroundColor) &&
            const DeepCollectionEquality().equals(disabledBackgroundColor, other.disabledBackgroundColor) &&
            const DeepCollectionEquality().equals(strongBackgroundColor, other.strongBackgroundColor));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(backgroundColor),
      const DeepCollectionEquality().hash(disabledBackgroundColor),
      const DeepCollectionEquality().hash(strongBackgroundColor),
    );
  }
}
