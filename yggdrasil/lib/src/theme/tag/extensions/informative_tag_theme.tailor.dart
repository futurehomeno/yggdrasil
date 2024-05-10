// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'informative_tag_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class YgInformativeTagTheme extends ThemeExtension<YgInformativeTagTheme> {
  const YgInformativeTagTheme({
    required this.backgroundColor,
    required this.disabledBackgroundColor,
    required this.strongBackgroundColor,
  });

  final Color backgroundColor;
  final Color disabledBackgroundColor;
  final Color strongBackgroundColor;

  static final YgInformativeTagTheme consumerLight = YgInformativeTagTheme(
    backgroundColor: _$YgInformativeTagTheme.backgroundColor[0],
    disabledBackgroundColor: _$YgInformativeTagTheme.disabledBackgroundColor[0],
    strongBackgroundColor: _$YgInformativeTagTheme.strongBackgroundColor[0],
  );

  static final YgInformativeTagTheme consumerDark = YgInformativeTagTheme(
    backgroundColor: _$YgInformativeTagTheme.backgroundColor[1],
    disabledBackgroundColor: _$YgInformativeTagTheme.disabledBackgroundColor[1],
    strongBackgroundColor: _$YgInformativeTagTheme.strongBackgroundColor[1],
  );

  static final YgInformativeTagTheme professionalLight = YgInformativeTagTheme(
    backgroundColor: _$YgInformativeTagTheme.backgroundColor[2],
    disabledBackgroundColor: _$YgInformativeTagTheme.disabledBackgroundColor[2],
    strongBackgroundColor: _$YgInformativeTagTheme.strongBackgroundColor[2],
  );

  static final YgInformativeTagTheme professionalDark = YgInformativeTagTheme(
    backgroundColor: _$YgInformativeTagTheme.backgroundColor[3],
    disabledBackgroundColor: _$YgInformativeTagTheme.disabledBackgroundColor[3],
    strongBackgroundColor: _$YgInformativeTagTheme.strongBackgroundColor[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  YgInformativeTagTheme copyWith({
    Color? backgroundColor,
    Color? disabledBackgroundColor,
    Color? strongBackgroundColor,
  }) {
    return YgInformativeTagTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      disabledBackgroundColor:
          disabledBackgroundColor ?? this.disabledBackgroundColor,
      strongBackgroundColor:
          strongBackgroundColor ?? this.strongBackgroundColor,
    );
  }

  @override
  YgInformativeTagTheme lerp(
      covariant ThemeExtension<YgInformativeTagTheme>? other, double t) {
    if (other is! YgInformativeTagTheme) return this as YgInformativeTagTheme;
    return YgInformativeTagTheme(
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
            other is YgInformativeTagTheme &&
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
