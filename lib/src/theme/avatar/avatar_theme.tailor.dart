// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'avatar_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class YgAvatarTheme extends ThemeExtension<YgAvatarTheme> {
  const YgAvatarTheme({
    required this.animationCurve,
    required this.animationDuration,
    required this.backgroundColor,
    required this.borderSide,
    required this.companyAvatarTheme,
    required this.diameterLarge,
    required this.diameterMedium,
    required this.diameterSmall,
    required this.personAvatarTheme,
  });

  final Curve animationCurve;
  final Duration animationDuration;
  final Color backgroundColor;
  final BorderSide borderSide;
  final YgCompanyAvatarTheme companyAvatarTheme;
  final double diameterLarge;
  final double diameterMedium;
  final double diameterSmall;
  final YgPersonAvatarTheme personAvatarTheme;

  static final YgAvatarTheme consumerLight = YgAvatarTheme(
    animationCurve: _$YgAvatarTheme.animationCurve[0],
    animationDuration: _$YgAvatarTheme.animationDuration[0],
    backgroundColor: _$YgAvatarTheme.backgroundColor[0],
    borderSide: _$YgAvatarTheme.borderSide[0],
    companyAvatarTheme: _$YgAvatarTheme.companyAvatarTheme[0],
    diameterLarge: _$YgAvatarTheme.diameterLarge[0],
    diameterMedium: _$YgAvatarTheme.diameterMedium[0],
    diameterSmall: _$YgAvatarTheme.diameterSmall[0],
    personAvatarTheme: _$YgAvatarTheme.personAvatarTheme[0],
  );

  static final YgAvatarTheme consumerDark = YgAvatarTheme(
    animationCurve: _$YgAvatarTheme.animationCurve[1],
    animationDuration: _$YgAvatarTheme.animationDuration[1],
    backgroundColor: _$YgAvatarTheme.backgroundColor[1],
    borderSide: _$YgAvatarTheme.borderSide[1],
    companyAvatarTheme: _$YgAvatarTheme.companyAvatarTheme[1],
    diameterLarge: _$YgAvatarTheme.diameterLarge[1],
    diameterMedium: _$YgAvatarTheme.diameterMedium[1],
    diameterSmall: _$YgAvatarTheme.diameterSmall[1],
    personAvatarTheme: _$YgAvatarTheme.personAvatarTheme[1],
  );

  static final YgAvatarTheme professionalLight = YgAvatarTheme(
    animationCurve: _$YgAvatarTheme.animationCurve[2],
    animationDuration: _$YgAvatarTheme.animationDuration[2],
    backgroundColor: _$YgAvatarTheme.backgroundColor[2],
    borderSide: _$YgAvatarTheme.borderSide[2],
    companyAvatarTheme: _$YgAvatarTheme.companyAvatarTheme[2],
    diameterLarge: _$YgAvatarTheme.diameterLarge[2],
    diameterMedium: _$YgAvatarTheme.diameterMedium[2],
    diameterSmall: _$YgAvatarTheme.diameterSmall[2],
    personAvatarTheme: _$YgAvatarTheme.personAvatarTheme[2],
  );

  static final YgAvatarTheme professionalDark = YgAvatarTheme(
    animationCurve: _$YgAvatarTheme.animationCurve[3],
    animationDuration: _$YgAvatarTheme.animationDuration[3],
    backgroundColor: _$YgAvatarTheme.backgroundColor[3],
    borderSide: _$YgAvatarTheme.borderSide[3],
    companyAvatarTheme: _$YgAvatarTheme.companyAvatarTheme[3],
    diameterLarge: _$YgAvatarTheme.diameterLarge[3],
    diameterMedium: _$YgAvatarTheme.diameterMedium[3],
    diameterSmall: _$YgAvatarTheme.diameterSmall[3],
    personAvatarTheme: _$YgAvatarTheme.personAvatarTheme[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  YgAvatarTheme copyWith({
    Curve? animationCurve,
    Duration? animationDuration,
    Color? backgroundColor,
    BorderSide? borderSide,
    YgCompanyAvatarTheme? companyAvatarTheme,
    double? diameterLarge,
    double? diameterMedium,
    double? diameterSmall,
    YgPersonAvatarTheme? personAvatarTheme,
  }) {
    return YgAvatarTheme(
      animationCurve: animationCurve ?? this.animationCurve,
      animationDuration: animationDuration ?? this.animationDuration,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      borderSide: borderSide ?? this.borderSide,
      companyAvatarTheme: companyAvatarTheme ?? this.companyAvatarTheme,
      diameterLarge: diameterLarge ?? this.diameterLarge,
      diameterMedium: diameterMedium ?? this.diameterMedium,
      diameterSmall: diameterSmall ?? this.diameterSmall,
      personAvatarTheme: personAvatarTheme ?? this.personAvatarTheme,
    );
  }

  @override
  YgAvatarTheme lerp(covariant ThemeExtension<YgAvatarTheme>? other, double t) {
    if (other is! YgAvatarTheme) return this as YgAvatarTheme;
    return YgAvatarTheme(
      animationCurve: t < 0.5 ? animationCurve : other.animationCurve,
      animationDuration: t < 0.5 ? animationDuration : other.animationDuration,
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      borderSide: t < 0.5 ? borderSide : other.borderSide,
      companyAvatarTheme: companyAvatarTheme.lerp(other.companyAvatarTheme, t)
          as YgCompanyAvatarTheme,
      diameterLarge: t < 0.5 ? diameterLarge : other.diameterLarge,
      diameterMedium: t < 0.5 ? diameterMedium : other.diameterMedium,
      diameterSmall: t < 0.5 ? diameterSmall : other.diameterSmall,
      personAvatarTheme: personAvatarTheme.lerp(other.personAvatarTheme, t)
          as YgPersonAvatarTheme,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is YgAvatarTheme &&
            const DeepCollectionEquality()
                .equals(animationCurve, other.animationCurve) &&
            const DeepCollectionEquality()
                .equals(animationDuration, other.animationDuration) &&
            const DeepCollectionEquality()
                .equals(backgroundColor, other.backgroundColor) &&
            const DeepCollectionEquality()
                .equals(borderSide, other.borderSide) &&
            const DeepCollectionEquality()
                .equals(companyAvatarTheme, other.companyAvatarTheme) &&
            const DeepCollectionEquality()
                .equals(diameterLarge, other.diameterLarge) &&
            const DeepCollectionEquality()
                .equals(diameterMedium, other.diameterMedium) &&
            const DeepCollectionEquality()
                .equals(diameterSmall, other.diameterSmall) &&
            const DeepCollectionEquality()
                .equals(personAvatarTheme, other.personAvatarTheme));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(animationCurve),
      const DeepCollectionEquality().hash(animationDuration),
      const DeepCollectionEquality().hash(backgroundColor),
      const DeepCollectionEquality().hash(borderSide),
      const DeepCollectionEquality().hash(companyAvatarTheme),
      const DeepCollectionEquality().hash(diameterLarge),
      const DeepCollectionEquality().hash(diameterMedium),
      const DeepCollectionEquality().hash(diameterSmall),
      const DeepCollectionEquality().hash(personAvatarTheme),
    );
  }
}
