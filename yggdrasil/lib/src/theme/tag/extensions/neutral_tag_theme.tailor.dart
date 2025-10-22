// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'neutral_tag_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class YgNeutralTagTheme extends ThemeExtension<YgNeutralTagTheme> {
  const YgNeutralTagTheme({
    required this.backgroundColor,
    required this.disabledBackgroundColor,
    required this.strongBackgroundColor,
  });

  final Color backgroundColor;
  final Color disabledBackgroundColor;
  final Color strongBackgroundColor;

  static final YgNeutralTagTheme consumerLight = YgNeutralTagTheme(
    backgroundColor: _$YgNeutralTagTheme.backgroundColor[0],
    disabledBackgroundColor: _$YgNeutralTagTheme.disabledBackgroundColor[0],
    strongBackgroundColor: _$YgNeutralTagTheme.strongBackgroundColor[0],
  );

  static final YgNeutralTagTheme consumerDark = YgNeutralTagTheme(
    backgroundColor: _$YgNeutralTagTheme.backgroundColor[1],
    disabledBackgroundColor: _$YgNeutralTagTheme.disabledBackgroundColor[1],
    strongBackgroundColor: _$YgNeutralTagTheme.strongBackgroundColor[1],
  );

  static final YgNeutralTagTheme professionalLight = YgNeutralTagTheme(
    backgroundColor: _$YgNeutralTagTheme.backgroundColor[2],
    disabledBackgroundColor: _$YgNeutralTagTheme.disabledBackgroundColor[2],
    strongBackgroundColor: _$YgNeutralTagTheme.strongBackgroundColor[2],
  );

  static final YgNeutralTagTheme professionalDark = YgNeutralTagTheme(
    backgroundColor: _$YgNeutralTagTheme.backgroundColor[3],
    disabledBackgroundColor: _$YgNeutralTagTheme.disabledBackgroundColor[3],
    strongBackgroundColor: _$YgNeutralTagTheme.strongBackgroundColor[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  YgNeutralTagTheme copyWith({
    Color? backgroundColor,
    Color? disabledBackgroundColor,
    Color? strongBackgroundColor,
  }) {
    return YgNeutralTagTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      disabledBackgroundColor: disabledBackgroundColor ?? this.disabledBackgroundColor,
      strongBackgroundColor: strongBackgroundColor ?? this.strongBackgroundColor,
    );
  }

  @override
  YgNeutralTagTheme lerp(covariant ThemeExtension<YgNeutralTagTheme>? other, double t) {
    if (other is! YgNeutralTagTheme) return this as YgNeutralTagTheme;
    return YgNeutralTagTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      disabledBackgroundColor: Color.lerp(disabledBackgroundColor, other.disabledBackgroundColor, t)!,
      strongBackgroundColor: Color.lerp(strongBackgroundColor, other.strongBackgroundColor, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is YgNeutralTagTheme &&
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
