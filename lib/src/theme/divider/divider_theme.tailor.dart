// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'divider_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class YgDividerTheme extends ThemeExtension<YgDividerTheme> {
  const YgDividerTheme({
    required this.color,
    required this.indentLarge,
    required this.indentMedium,
    required this.indentSmall,
  });

  final Color color;
  final double indentLarge;
  final double indentMedium;
  final double indentSmall;

  static final YgDividerTheme consumerLight = YgDividerTheme(
    color: _$YgDividerTheme.color[0],
    indentLarge: _$YgDividerTheme.indentLarge[0],
    indentMedium: _$YgDividerTheme.indentMedium[0],
    indentSmall: _$YgDividerTheme.indentSmall[0],
  );

  static final YgDividerTheme consumerDark = YgDividerTheme(
    color: _$YgDividerTheme.color[1],
    indentLarge: _$YgDividerTheme.indentLarge[1],
    indentMedium: _$YgDividerTheme.indentMedium[1],
    indentSmall: _$YgDividerTheme.indentSmall[1],
  );

  static final YgDividerTheme professionalLight = YgDividerTheme(
    color: _$YgDividerTheme.color[2],
    indentLarge: _$YgDividerTheme.indentLarge[2],
    indentMedium: _$YgDividerTheme.indentMedium[2],
    indentSmall: _$YgDividerTheme.indentSmall[2],
  );

  static final YgDividerTheme professionalDark = YgDividerTheme(
    color: _$YgDividerTheme.color[3],
    indentLarge: _$YgDividerTheme.indentLarge[3],
    indentMedium: _$YgDividerTheme.indentMedium[3],
    indentSmall: _$YgDividerTheme.indentSmall[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  YgDividerTheme copyWith({
    Color? color,
    double? indentLarge,
    double? indentMedium,
    double? indentSmall,
  }) {
    return YgDividerTheme(
      color: color ?? this.color,
      indentLarge: indentLarge ?? this.indentLarge,
      indentMedium: indentMedium ?? this.indentMedium,
      indentSmall: indentSmall ?? this.indentSmall,
    );
  }

  @override
  YgDividerTheme lerp(
      covariant ThemeExtension<YgDividerTheme>? other, double t) {
    if (other is! YgDividerTheme) return this as YgDividerTheme;
    return YgDividerTheme(
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
            other is YgDividerTheme &&
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
