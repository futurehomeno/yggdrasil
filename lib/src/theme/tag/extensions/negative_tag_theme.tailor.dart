// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'negative_tag_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class YgNegativeTagTheme extends ThemeExtension<YgNegativeTagTheme> {
  const YgNegativeTagTheme({
    required this.backgroundColor,
    required this.disabledBackgroundColor,
    required this.strongBackgroundColor,
  });

  final Color backgroundColor;
  final Color disabledBackgroundColor;
  final Color strongBackgroundColor;

  static final YgNegativeTagTheme consumerLight = YgNegativeTagTheme(
    backgroundColor: _$YgNegativeTagTheme.backgroundColor[0],
    disabledBackgroundColor: _$YgNegativeTagTheme.disabledBackgroundColor[0],
    strongBackgroundColor: _$YgNegativeTagTheme.strongBackgroundColor[0],
  );

  static final YgNegativeTagTheme consumerDark = YgNegativeTagTheme(
    backgroundColor: _$YgNegativeTagTheme.backgroundColor[1],
    disabledBackgroundColor: _$YgNegativeTagTheme.disabledBackgroundColor[1],
    strongBackgroundColor: _$YgNegativeTagTheme.strongBackgroundColor[1],
  );

  static final YgNegativeTagTheme professionalLight = YgNegativeTagTheme(
    backgroundColor: _$YgNegativeTagTheme.backgroundColor[2],
    disabledBackgroundColor: _$YgNegativeTagTheme.disabledBackgroundColor[2],
    strongBackgroundColor: _$YgNegativeTagTheme.strongBackgroundColor[2],
  );

  static final YgNegativeTagTheme professionalDark = YgNegativeTagTheme(
    backgroundColor: _$YgNegativeTagTheme.backgroundColor[3],
    disabledBackgroundColor: _$YgNegativeTagTheme.disabledBackgroundColor[3],
    strongBackgroundColor: _$YgNegativeTagTheme.strongBackgroundColor[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  YgNegativeTagTheme copyWith({
    Color? backgroundColor,
    Color? disabledBackgroundColor,
    Color? strongBackgroundColor,
  }) {
    return YgNegativeTagTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      disabledBackgroundColor:
          disabledBackgroundColor ?? this.disabledBackgroundColor,
      strongBackgroundColor:
          strongBackgroundColor ?? this.strongBackgroundColor,
    );
  }

  @override
  YgNegativeTagTheme lerp(
      covariant ThemeExtension<YgNegativeTagTheme>? other, double t) {
    if (other is! YgNegativeTagTheme) return this as YgNegativeTagTheme;
    return YgNegativeTagTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      disabledBackgroundColor: Color.lerp(
          disabledBackgroundColor, other.disabledBackgroundColor, t)!,
      strongBackgroundColor:
          Color.lerp(strongBackgroundColor, other.strongBackgroundColor, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is YgNegativeTagTheme &&
            const DeepCollectionEquality()
                .equals(backgroundColor, other.backgroundColor) &&
            const DeepCollectionEquality().equals(
                disabledBackgroundColor, other.disabledBackgroundColor) &&
            const DeepCollectionEquality()
                .equals(strongBackgroundColor, other.strongBackgroundColor));
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
