// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'informative_tag_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class InformativeTagTheme extends ThemeExtension<InformativeTagTheme> {
  const InformativeTagTheme({
    required this.backgroundColor,
    required this.disabledBackgroundColor,
    required this.strongBackgroundColor,
  });

  final Color backgroundColor;
  final Color disabledBackgroundColor;
  final Color strongBackgroundColor;

  static final InformativeTagTheme consumerLight = InformativeTagTheme(
    backgroundColor: _$InformativeTagTheme.backgroundColor[0],
    disabledBackgroundColor: _$InformativeTagTheme.disabledBackgroundColor[0],
    strongBackgroundColor: _$InformativeTagTheme.strongBackgroundColor[0],
  );

  static final InformativeTagTheme consumerDark = InformativeTagTheme(
    backgroundColor: _$InformativeTagTheme.backgroundColor[1],
    disabledBackgroundColor: _$InformativeTagTheme.disabledBackgroundColor[1],
    strongBackgroundColor: _$InformativeTagTheme.strongBackgroundColor[1],
  );

  static final InformativeTagTheme professionalLight = InformativeTagTheme(
    backgroundColor: _$InformativeTagTheme.backgroundColor[2],
    disabledBackgroundColor: _$InformativeTagTheme.disabledBackgroundColor[2],
    strongBackgroundColor: _$InformativeTagTheme.strongBackgroundColor[2],
  );

  static final InformativeTagTheme professionalDark = InformativeTagTheme(
    backgroundColor: _$InformativeTagTheme.backgroundColor[3],
    disabledBackgroundColor: _$InformativeTagTheme.disabledBackgroundColor[3],
    strongBackgroundColor: _$InformativeTagTheme.strongBackgroundColor[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  InformativeTagTheme copyWith({
    Color? backgroundColor,
    Color? disabledBackgroundColor,
    Color? strongBackgroundColor,
  }) {
    return InformativeTagTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      disabledBackgroundColor: disabledBackgroundColor ?? this.disabledBackgroundColor,
      strongBackgroundColor: strongBackgroundColor ?? this.strongBackgroundColor,
    );
  }

  @override
  InformativeTagTheme lerp(covariant ThemeExtension<InformativeTagTheme>? other, double t) {
    if (other is! InformativeTagTheme) return this as InformativeTagTheme;
    return InformativeTagTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      disabledBackgroundColor: Color.lerp(disabledBackgroundColor, other.disabledBackgroundColor, t)!,
      strongBackgroundColor: Color.lerp(strongBackgroundColor, other.strongBackgroundColor, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InformativeTagTheme &&
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
