// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'progress_indicator_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class YgProgressIndicatorTheme extends ThemeExtension<YgProgressIndicatorTheme> {
  const YgProgressIndicatorTheme({
    required this.circularProgressIndicatorTheme,
    required this.linearProgressIndicatorTheme,
    required this.progressPercentageIndicatorTheme,
  });

  final CircularProgressIndicatorTheme circularProgressIndicatorTheme;
  final LinearProgressIndicatorTheme linearProgressIndicatorTheme;
  final ProgressPercentageIndicatorTheme progressPercentageIndicatorTheme;

  static final YgProgressIndicatorTheme consumerLight = YgProgressIndicatorTheme(
    circularProgressIndicatorTheme: _$YgProgressIndicatorTheme.circularProgressIndicatorTheme[0],
    linearProgressIndicatorTheme: _$YgProgressIndicatorTheme.linearProgressIndicatorTheme[0],
    progressPercentageIndicatorTheme: _$YgProgressIndicatorTheme.progressPercentageIndicatorTheme[0],
  );

  static final YgProgressIndicatorTheme consumerDark = YgProgressIndicatorTheme(
    circularProgressIndicatorTheme: _$YgProgressIndicatorTheme.circularProgressIndicatorTheme[1],
    linearProgressIndicatorTheme: _$YgProgressIndicatorTheme.linearProgressIndicatorTheme[1],
    progressPercentageIndicatorTheme: _$YgProgressIndicatorTheme.progressPercentageIndicatorTheme[1],
  );

  static final YgProgressIndicatorTheme professionalLight = YgProgressIndicatorTheme(
    circularProgressIndicatorTheme: _$YgProgressIndicatorTheme.circularProgressIndicatorTheme[2],
    linearProgressIndicatorTheme: _$YgProgressIndicatorTheme.linearProgressIndicatorTheme[2],
    progressPercentageIndicatorTheme: _$YgProgressIndicatorTheme.progressPercentageIndicatorTheme[2],
  );

  static final YgProgressIndicatorTheme professionalDark = YgProgressIndicatorTheme(
    circularProgressIndicatorTheme: _$YgProgressIndicatorTheme.circularProgressIndicatorTheme[3],
    linearProgressIndicatorTheme: _$YgProgressIndicatorTheme.linearProgressIndicatorTheme[3],
    progressPercentageIndicatorTheme: _$YgProgressIndicatorTheme.progressPercentageIndicatorTheme[3],
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
    ProgressPercentageIndicatorTheme? progressPercentageIndicatorTheme,
  }) {
    return YgProgressIndicatorTheme(
      circularProgressIndicatorTheme: circularProgressIndicatorTheme ?? this.circularProgressIndicatorTheme,
      linearProgressIndicatorTheme: linearProgressIndicatorTheme ?? this.linearProgressIndicatorTheme,
      progressPercentageIndicatorTheme:
          progressPercentageIndicatorTheme ?? this.progressPercentageIndicatorTheme,
    );
  }

  @override
  YgProgressIndicatorTheme lerp(covariant ThemeExtension<YgProgressIndicatorTheme>? other, double t) {
    if (other is! YgProgressIndicatorTheme) return this as YgProgressIndicatorTheme;
    return YgProgressIndicatorTheme(
      circularProgressIndicatorTheme:
          circularProgressIndicatorTheme.lerp(other.circularProgressIndicatorTheme, t)
              as CircularProgressIndicatorTheme,
      linearProgressIndicatorTheme:
          linearProgressIndicatorTheme.lerp(other.linearProgressIndicatorTheme, t) as LinearProgressIndicatorTheme,
      progressPercentageIndicatorTheme:
          progressPercentageIndicatorTheme.lerp(other.progressPercentageIndicatorTheme, t)
              as ProgressPercentageIndicatorTheme,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is YgProgressIndicatorTheme &&
            const DeepCollectionEquality().equals(
              circularProgressIndicatorTheme,
              other.circularProgressIndicatorTheme,
            ) &&
            const DeepCollectionEquality().equals(linearProgressIndicatorTheme, other.linearProgressIndicatorTheme) &&
            const DeepCollectionEquality().equals(
                progressPercentageIndicatorTheme, other.progressPercentageIndicatorTheme));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(circularProgressIndicatorTheme),
      const DeepCollectionEquality().hash(linearProgressIndicatorTheme),
      const DeepCollectionEquality().hash(progressPercentageIndicatorTheme),
    );
  }
}
