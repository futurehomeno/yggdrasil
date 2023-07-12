// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'divider_themes.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class YgDividerThemes extends ThemeExtension<YgDividerThemes> {
  const YgDividerThemes({
    required this.color,
    required this.indentLarge,
    required this.indentMedium,
    required this.indentSmall,
  });

  final Color color;
  final double indentLarge;
  final double indentMedium;
  final double indentSmall;

  static final YgDividerThemes consumerLight = YgDividerThemes(
    color: _$YgDividerThemes.color[0],
    indentLarge: _$YgDividerThemes.indentLarge[0],
    indentMedium: _$YgDividerThemes.indentMedium[0],
    indentSmall: _$YgDividerThemes.indentSmall[0],
  );

  static final YgDividerThemes consumerDark = YgDividerThemes(
    color: _$YgDividerThemes.color[1],
    indentLarge: _$YgDividerThemes.indentLarge[1],
    indentMedium: _$YgDividerThemes.indentMedium[1],
    indentSmall: _$YgDividerThemes.indentSmall[1],
  );

  static final YgDividerThemes professionalLight = YgDividerThemes(
    color: _$YgDividerThemes.color[2],
    indentLarge: _$YgDividerThemes.indentLarge[2],
    indentMedium: _$YgDividerThemes.indentMedium[2],
    indentSmall: _$YgDividerThemes.indentSmall[2],
  );

  static final YgDividerThemes professionalDark = YgDividerThemes(
    color: _$YgDividerThemes.color[3],
    indentLarge: _$YgDividerThemes.indentLarge[3],
    indentMedium: _$YgDividerThemes.indentMedium[3],
    indentSmall: _$YgDividerThemes.indentSmall[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  YgDividerThemes copyWith({
    Color? color,
    double? indentLarge,
    double? indentMedium,
    double? indentSmall,
  }) {
    return YgDividerThemes(
      color: color ?? this.color,
      indentLarge: indentLarge ?? this.indentLarge,
      indentMedium: indentMedium ?? this.indentMedium,
      indentSmall: indentSmall ?? this.indentSmall,
    );
  }

  @override
  YgDividerThemes lerp(
      covariant ThemeExtension<YgDividerThemes>? other, double t) {
    if (other is! YgDividerThemes) return this as YgDividerThemes;
    return YgDividerThemes(
      color: Color.lerp(color, other.color, t)!,
      indentLarge: t < 0.5 ? indentLarge : other.indentLarge,
      indentMedium: t < 0.5 ? indentMedium : other.indentMedium,
      indentSmall: t < 0.5 ? indentSmall : other.indentSmall,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is YgDividerThemes &&
            const DeepCollectionEquality().equals(color, other.color) &&
            const DeepCollectionEquality()
                .equals(indentLarge, other.indentLarge) &&
            const DeepCollectionEquality()
                .equals(indentMedium, other.indentMedium) &&
            const DeepCollectionEquality()
                .equals(indentSmall, other.indentSmall));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(color),
      const DeepCollectionEquality().hash(indentLarge),
      const DeepCollectionEquality().hash(indentMedium),
      const DeepCollectionEquality().hash(indentSmall),
    );
  }
}
