// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'field_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class YgFieldTheme extends ThemeExtension<YgFieldTheme> {
  const YgFieldTheme({
    required this.animationCurve,
    required this.animationDuration,
    required this.contentTheme,
    required this.decorationTheme,
  });

  final Curve animationCurve;
  final Duration animationDuration;
  final YgFieldContentTheme contentTheme;
  final YgFieldDecorationTheme decorationTheme;

  static final YgFieldTheme consumerLight = YgFieldTheme(
    animationCurve: _$YgFieldTheme.animationCurve[0],
    animationDuration: _$YgFieldTheme.animationDuration[0],
    contentTheme: _$YgFieldTheme.contentTheme[0],
    decorationTheme: _$YgFieldTheme.decorationTheme[0],
  );

  static final YgFieldTheme consumerDark = YgFieldTheme(
    animationCurve: _$YgFieldTheme.animationCurve[1],
    animationDuration: _$YgFieldTheme.animationDuration[1],
    contentTheme: _$YgFieldTheme.contentTheme[1],
    decorationTheme: _$YgFieldTheme.decorationTheme[1],
  );

  static final YgFieldTheme professionalLight = YgFieldTheme(
    animationCurve: _$YgFieldTheme.animationCurve[2],
    animationDuration: _$YgFieldTheme.animationDuration[2],
    contentTheme: _$YgFieldTheme.contentTheme[2],
    decorationTheme: _$YgFieldTheme.decorationTheme[2],
  );

  static final YgFieldTheme professionalDark = YgFieldTheme(
    animationCurve: _$YgFieldTheme.animationCurve[3],
    animationDuration: _$YgFieldTheme.animationDuration[3],
    contentTheme: _$YgFieldTheme.contentTheme[3],
    decorationTheme: _$YgFieldTheme.decorationTheme[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  YgFieldTheme copyWith({
    Curve? animationCurve,
    Duration? animationDuration,
    YgFieldContentTheme? contentTheme,
    YgFieldDecorationTheme? decorationTheme,
  }) {
    return YgFieldTheme(
      animationCurve: animationCurve ?? this.animationCurve,
      animationDuration: animationDuration ?? this.animationDuration,
      contentTheme: contentTheme ?? this.contentTheme,
      decorationTheme: decorationTheme ?? this.decorationTheme,
    );
  }

  @override
  YgFieldTheme lerp(covariant ThemeExtension<YgFieldTheme>? other, double t) {
    if (other is! YgFieldTheme) return this as YgFieldTheme;
    return YgFieldTheme(
      animationCurve: t < 0.5 ? animationCurve : other.animationCurve,
      animationDuration: t < 0.5 ? animationDuration : other.animationDuration,
      contentTheme:
          contentTheme.lerp(other.contentTheme, t) as YgFieldContentTheme,
      decorationTheme: decorationTheme.lerp(other.decorationTheme, t)
          as YgFieldDecorationTheme,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is YgFieldTheme &&
            const DeepCollectionEquality()
                .equals(animationCurve, other.animationCurve) &&
            const DeepCollectionEquality()
                .equals(animationDuration, other.animationDuration) &&
            const DeepCollectionEquality()
                .equals(contentTheme, other.contentTheme) &&
            const DeepCollectionEquality()
                .equals(decorationTheme, other.decorationTheme));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(animationCurve),
      const DeepCollectionEquality().hash(animationDuration),
      const DeepCollectionEquality().hash(contentTheme),
      const DeepCollectionEquality().hash(decorationTheme),
    );
  }
}
