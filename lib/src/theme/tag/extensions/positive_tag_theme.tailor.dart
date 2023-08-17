// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'positive_tag_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class PositiveTagTheme extends ThemeExtension<PositiveTagTheme> {
  const PositiveTagTheme({
    required this.backgroundColor,
    required this.disabledBackgroundColor,
    required this.strongBackgroundColor,
  });

  final Color backgroundColor;
  final Color disabledBackgroundColor;
  final Color strongBackgroundColor;

  static final PositiveTagTheme consumerLight = PositiveTagTheme(
    backgroundColor: _$PositiveTagTheme.backgroundColor[0],
    disabledBackgroundColor: _$PositiveTagTheme.disabledBackgroundColor[0],
    strongBackgroundColor: _$PositiveTagTheme.strongBackgroundColor[0],
  );

  static final PositiveTagTheme consumerDark = PositiveTagTheme(
    backgroundColor: _$PositiveTagTheme.backgroundColor[1],
    disabledBackgroundColor: _$PositiveTagTheme.disabledBackgroundColor[1],
    strongBackgroundColor: _$PositiveTagTheme.strongBackgroundColor[1],
  );

  static final PositiveTagTheme professionalLight = PositiveTagTheme(
    backgroundColor: _$PositiveTagTheme.backgroundColor[2],
    disabledBackgroundColor: _$PositiveTagTheme.disabledBackgroundColor[2],
    strongBackgroundColor: _$PositiveTagTheme.strongBackgroundColor[2],
  );

  static final PositiveTagTheme professionalDark = PositiveTagTheme(
    backgroundColor: _$PositiveTagTheme.backgroundColor[3],
    disabledBackgroundColor: _$PositiveTagTheme.disabledBackgroundColor[3],
    strongBackgroundColor: _$PositiveTagTheme.strongBackgroundColor[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  PositiveTagTheme copyWith({
    Color? backgroundColor,
    Color? disabledBackgroundColor,
    Color? strongBackgroundColor,
  }) {
    return PositiveTagTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      disabledBackgroundColor: disabledBackgroundColor ?? this.disabledBackgroundColor,
      strongBackgroundColor: strongBackgroundColor ?? this.strongBackgroundColor,
    );
  }

  @override
  PositiveTagTheme lerp(covariant ThemeExtension<PositiveTagTheme>? other, double t) {
    if (other is! PositiveTagTheme) return this as PositiveTagTheme;
    return PositiveTagTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      disabledBackgroundColor: Color.lerp(disabledBackgroundColor, other.disabledBackgroundColor, t)!,
      strongBackgroundColor: Color.lerp(strongBackgroundColor, other.strongBackgroundColor, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PositiveTagTheme &&
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
