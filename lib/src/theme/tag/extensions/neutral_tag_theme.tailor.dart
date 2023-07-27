// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'neutral_tag_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class NeutralTagTheme extends ThemeExtension<NeutralTagTheme> {
  const NeutralTagTheme({
    required this.backgroundColor,
    required this.disabledBackgroundColor,
    required this.strongBackgroundColor,
  });

  final Color backgroundColor;
  final Color disabledBackgroundColor;
  final Color strongBackgroundColor;

  static final NeutralTagTheme consumerLight = NeutralTagTheme(
    backgroundColor: _$NeutralTagTheme.backgroundColor[0],
    disabledBackgroundColor: _$NeutralTagTheme.disabledBackgroundColor[0],
    strongBackgroundColor: _$NeutralTagTheme.strongBackgroundColor[0],
  );

  static final NeutralTagTheme consumerDark = NeutralTagTheme(
    backgroundColor: _$NeutralTagTheme.backgroundColor[1],
    disabledBackgroundColor: _$NeutralTagTheme.disabledBackgroundColor[1],
    strongBackgroundColor: _$NeutralTagTheme.strongBackgroundColor[1],
  );

  static final NeutralTagTheme professionalLight = NeutralTagTheme(
    backgroundColor: _$NeutralTagTheme.backgroundColor[2],
    disabledBackgroundColor: _$NeutralTagTheme.disabledBackgroundColor[2],
    strongBackgroundColor: _$NeutralTagTheme.strongBackgroundColor[2],
  );

  static final NeutralTagTheme professionalDark = NeutralTagTheme(
    backgroundColor: _$NeutralTagTheme.backgroundColor[3],
    disabledBackgroundColor: _$NeutralTagTheme.disabledBackgroundColor[3],
    strongBackgroundColor: _$NeutralTagTheme.strongBackgroundColor[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  NeutralTagTheme copyWith({
    Color? backgroundColor,
    Color? disabledBackgroundColor,
    Color? strongBackgroundColor,
  }) {
    return NeutralTagTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      disabledBackgroundColor:
          disabledBackgroundColor ?? this.disabledBackgroundColor,
      strongBackgroundColor:
          strongBackgroundColor ?? this.strongBackgroundColor,
    );
  }

  @override
  NeutralTagTheme lerp(
      covariant ThemeExtension<NeutralTagTheme>? other, double t) {
    if (other is! NeutralTagTheme) return this as NeutralTagTheme;
    return NeutralTagTheme(
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
            other is NeutralTagTheme &&
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
