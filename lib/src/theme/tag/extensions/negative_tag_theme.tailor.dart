// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'negative_tag_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class NegativeTagTheme extends ThemeExtension<NegativeTagTheme> {
  const NegativeTagTheme({
    required this.backgroundColor,
    required this.disabledBackgroundColor,
    required this.strongBackgroundColor,
  });

  final Color backgroundColor;
  final Color disabledBackgroundColor;
  final Color strongBackgroundColor;

  static final NegativeTagTheme consumerLight = NegativeTagTheme(
    backgroundColor: _$NegativeTagTheme.backgroundColor[0],
    disabledBackgroundColor: _$NegativeTagTheme.disabledBackgroundColor[0],
    strongBackgroundColor: _$NegativeTagTheme.strongBackgroundColor[0],
  );

  static final NegativeTagTheme consumerDark = NegativeTagTheme(
    backgroundColor: _$NegativeTagTheme.backgroundColor[1],
    disabledBackgroundColor: _$NegativeTagTheme.disabledBackgroundColor[1],
    strongBackgroundColor: _$NegativeTagTheme.strongBackgroundColor[1],
  );

  static final NegativeTagTheme professionalLight = NegativeTagTheme(
    backgroundColor: _$NegativeTagTheme.backgroundColor[2],
    disabledBackgroundColor: _$NegativeTagTheme.disabledBackgroundColor[2],
    strongBackgroundColor: _$NegativeTagTheme.strongBackgroundColor[2],
  );

  static final NegativeTagTheme professionalDark = NegativeTagTheme(
    backgroundColor: _$NegativeTagTheme.backgroundColor[3],
    disabledBackgroundColor: _$NegativeTagTheme.disabledBackgroundColor[3],
    strongBackgroundColor: _$NegativeTagTheme.strongBackgroundColor[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  NegativeTagTheme copyWith({
    Color? backgroundColor,
    Color? disabledBackgroundColor,
    Color? strongBackgroundColor,
  }) {
    return NegativeTagTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      disabledBackgroundColor: disabledBackgroundColor ?? this.disabledBackgroundColor,
      strongBackgroundColor: strongBackgroundColor ?? this.strongBackgroundColor,
    );
  }

  @override
  NegativeTagTheme lerp(covariant ThemeExtension<NegativeTagTheme>? other, double t) {
    if (other is! NegativeTagTheme) return this as NegativeTagTheme;
    return NegativeTagTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      disabledBackgroundColor: Color.lerp(disabledBackgroundColor, other.disabledBackgroundColor, t)!,
      strongBackgroundColor: Color.lerp(strongBackgroundColor, other.strongBackgroundColor, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NegativeTagTheme &&
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
