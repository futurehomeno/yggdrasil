// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'progress_indicator_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class YgProgressIndicatorTheme
    extends ThemeExtension<YgProgressIndicatorTheme> {
  const YgProgressIndicatorTheme({
    required this.circularProgressIndicatorTheme,
    required this.linearProgressIndicatorTheme,
  });

  final CircularProgressIndicatorTheme circularProgressIndicatorTheme;
  final LinearProgressIndicatorTheme linearProgressIndicatorTheme;

  static final YgProgressIndicatorTheme consumerLight =
      YgProgressIndicatorTheme(
    circularProgressIndicatorTheme:
        _$YgProgressIndicatorTheme.circularProgressIndicatorTheme[0],
    linearProgressIndicatorTheme:
        _$YgProgressIndicatorTheme.linearProgressIndicatorTheme[0],
  );

  static final YgProgressIndicatorTheme consumerDark = YgProgressIndicatorTheme(
    circularProgressIndicatorTheme:
        _$YgProgressIndicatorTheme.circularProgressIndicatorTheme[1],
    linearProgressIndicatorTheme:
        _$YgProgressIndicatorTheme.linearProgressIndicatorTheme[1],
  );

  static final YgProgressIndicatorTheme professionalLight =
      YgProgressIndicatorTheme(
    circularProgressIndicatorTheme:
        _$YgProgressIndicatorTheme.circularProgressIndicatorTheme[2],
    linearProgressIndicatorTheme:
        _$YgProgressIndicatorTheme.linearProgressIndicatorTheme[2],
  );

  static final YgProgressIndicatorTheme professionalDark =
      YgProgressIndicatorTheme(
    circularProgressIndicatorTheme:
        _$YgProgressIndicatorTheme.circularProgressIndicatorTheme[3],
    linearProgressIndicatorTheme:
        _$YgProgressIndicatorTheme.linearProgressIndicatorTheme[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  YgProgressIndicatorTheme copyWith({
    CircularProgressIndicatorTheme? circularProgressIndicatorTheme,
    LinearProgressIndicatorTheme? linearProgressIndicatorTheme,
  }) {
    return YgProgressIndicatorTheme(
      circularProgressIndicatorTheme:
          circularProgressIndicatorTheme ?? this.circularProgressIndicatorTheme,
      linearProgressIndicatorTheme:
          linearProgressIndicatorTheme ?? this.linearProgressIndicatorTheme,
    );
  }

  @override
  YgProgressIndicatorTheme lerp(
      covariant ThemeExtension<YgProgressIndicatorTheme>? other, double t) {
    if (other is! YgProgressIndicatorTheme)
      return this as YgProgressIndicatorTheme;
    return YgProgressIndicatorTheme(
      circularProgressIndicatorTheme: circularProgressIndicatorTheme.lerp(
              other.circularProgressIndicatorTheme, t)
          as CircularProgressIndicatorTheme,
      linearProgressIndicatorTheme: linearProgressIndicatorTheme.lerp(
              other.linearProgressIndicatorTheme, t)
          as LinearProgressIndicatorTheme,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is YgProgressIndicatorTheme &&
            const DeepCollectionEquality().equals(
                circularProgressIndicatorTheme,
                other.circularProgressIndicatorTheme) &&
            const DeepCollectionEquality().equals(linearProgressIndicatorTheme,
                other.linearProgressIndicatorTheme));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(circularProgressIndicatorTheme),
      const DeepCollectionEquality().hash(linearProgressIndicatorTheme),
    );
  }
}
