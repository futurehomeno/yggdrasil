// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'warning_tag_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class WarningTagTheme extends ThemeExtension<WarningTagTheme> {
  const WarningTagTheme({
    required this.backgroundColor,
    required this.disabledBackgroundColor,
    required this.strongBackgroundColor,
  });

  final Color backgroundColor;
  final Color disabledBackgroundColor;
  final Color strongBackgroundColor;

  static final WarningTagTheme consumerLight = WarningTagTheme(
    backgroundColor: _$WarningTagTheme.backgroundColor[0],
    disabledBackgroundColor: _$WarningTagTheme.disabledBackgroundColor[0],
    strongBackgroundColor: _$WarningTagTheme.strongBackgroundColor[0],
  );

  static final WarningTagTheme consumerDark = WarningTagTheme(
    backgroundColor: _$WarningTagTheme.backgroundColor[1],
    disabledBackgroundColor: _$WarningTagTheme.disabledBackgroundColor[1],
    strongBackgroundColor: _$WarningTagTheme.strongBackgroundColor[1],
  );

  static final WarningTagTheme professionalLight = WarningTagTheme(
    backgroundColor: _$WarningTagTheme.backgroundColor[2],
    disabledBackgroundColor: _$WarningTagTheme.disabledBackgroundColor[2],
    strongBackgroundColor: _$WarningTagTheme.strongBackgroundColor[2],
  );

  static final WarningTagTheme professionalDark = WarningTagTheme(
    backgroundColor: _$WarningTagTheme.backgroundColor[3],
    disabledBackgroundColor: _$WarningTagTheme.disabledBackgroundColor[3],
    strongBackgroundColor: _$WarningTagTheme.strongBackgroundColor[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  WarningTagTheme copyWith({
    Color? backgroundColor,
    Color? disabledBackgroundColor,
    Color? strongBackgroundColor,
  }) {
    return WarningTagTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      disabledBackgroundColor:
          disabledBackgroundColor ?? this.disabledBackgroundColor,
      strongBackgroundColor:
          strongBackgroundColor ?? this.strongBackgroundColor,
    );
  }

  @override
  WarningTagTheme lerp(
      covariant ThemeExtension<WarningTagTheme>? other, double t) {
    if (other is! WarningTagTheme) return this as WarningTagTheme;
    return WarningTagTheme(
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
            other is WarningTagTheme &&
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
