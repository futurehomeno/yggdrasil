// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'warning_tag_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class YgWarningTagTheme extends ThemeExtension<YgWarningTagTheme> {
  const YgWarningTagTheme({
    required this.backgroundColor,
    required this.disabledBackgroundColor,
    required this.strongBackgroundColor,
  });

  final Color backgroundColor;
  final Color disabledBackgroundColor;
  final Color strongBackgroundColor;

  static final YgWarningTagTheme consumerLight = YgWarningTagTheme(
    backgroundColor: _$YgWarningTagTheme.backgroundColor[0],
    disabledBackgroundColor: _$YgWarningTagTheme.disabledBackgroundColor[0],
    strongBackgroundColor: _$YgWarningTagTheme.strongBackgroundColor[0],
  );

  static final YgWarningTagTheme consumerDark = YgWarningTagTheme(
    backgroundColor: _$YgWarningTagTheme.backgroundColor[1],
    disabledBackgroundColor: _$YgWarningTagTheme.disabledBackgroundColor[1],
    strongBackgroundColor: _$YgWarningTagTheme.strongBackgroundColor[1],
  );

  static final YgWarningTagTheme professionalLight = YgWarningTagTheme(
    backgroundColor: _$YgWarningTagTheme.backgroundColor[2],
    disabledBackgroundColor: _$YgWarningTagTheme.disabledBackgroundColor[2],
    strongBackgroundColor: _$YgWarningTagTheme.strongBackgroundColor[2],
  );

  static final YgWarningTagTheme professionalDark = YgWarningTagTheme(
    backgroundColor: _$YgWarningTagTheme.backgroundColor[3],
    disabledBackgroundColor: _$YgWarningTagTheme.disabledBackgroundColor[3],
    strongBackgroundColor: _$YgWarningTagTheme.strongBackgroundColor[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  YgWarningTagTheme copyWith({
    Color? backgroundColor,
    Color? disabledBackgroundColor,
    Color? strongBackgroundColor,
  }) {
    return YgWarningTagTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      disabledBackgroundColor: disabledBackgroundColor ?? this.disabledBackgroundColor,
      strongBackgroundColor: strongBackgroundColor ?? this.strongBackgroundColor,
    );
  }

  @override
  YgWarningTagTheme lerp(covariant ThemeExtension<YgWarningTagTheme>? other, double t) {
    if (other is! YgWarningTagTheme) return this as YgWarningTagTheme;
    return YgWarningTagTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      disabledBackgroundColor: Color.lerp(disabledBackgroundColor, other.disabledBackgroundColor, t)!,
      strongBackgroundColor: Color.lerp(strongBackgroundColor, other.strongBackgroundColor, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is YgWarningTagTheme &&
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
