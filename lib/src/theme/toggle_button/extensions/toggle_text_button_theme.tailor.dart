// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'toggle_text_button_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class ToggleTextButtonTheme extends ThemeExtension<ToggleTextButtonTheme> {
  const ToggleTextButtonTheme({
    required this.paddingLarge,
    required this.paddingMedium,
    required this.paddingSmall,
  });

  final EdgeInsets paddingLarge;
  final EdgeInsets paddingMedium;
  final EdgeInsets paddingSmall;

  static final ToggleTextButtonTheme consumerLight = ToggleTextButtonTheme(
    paddingLarge: _$ToggleTextButtonTheme.paddingLarge[0],
    paddingMedium: _$ToggleTextButtonTheme.paddingMedium[0],
    paddingSmall: _$ToggleTextButtonTheme.paddingSmall[0],
  );

  static final ToggleTextButtonTheme consumerDark = ToggleTextButtonTheme(
    paddingLarge: _$ToggleTextButtonTheme.paddingLarge[1],
    paddingMedium: _$ToggleTextButtonTheme.paddingMedium[1],
    paddingSmall: _$ToggleTextButtonTheme.paddingSmall[1],
  );

  static final ToggleTextButtonTheme professionalLight = ToggleTextButtonTheme(
    paddingLarge: _$ToggleTextButtonTheme.paddingLarge[2],
    paddingMedium: _$ToggleTextButtonTheme.paddingMedium[2],
    paddingSmall: _$ToggleTextButtonTheme.paddingSmall[2],
  );

  static final ToggleTextButtonTheme professionalDark = ToggleTextButtonTheme(
    paddingLarge: _$ToggleTextButtonTheme.paddingLarge[3],
    paddingMedium: _$ToggleTextButtonTheme.paddingMedium[3],
    paddingSmall: _$ToggleTextButtonTheme.paddingSmall[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  ToggleTextButtonTheme copyWith({
    EdgeInsets? paddingLarge,
    EdgeInsets? paddingMedium,
    EdgeInsets? paddingSmall,
  }) {
    return ToggleTextButtonTheme(
      paddingLarge: paddingLarge ?? this.paddingLarge,
      paddingMedium: paddingMedium ?? this.paddingMedium,
      paddingSmall: paddingSmall ?? this.paddingSmall,
    );
  }

  @override
  ToggleTextButtonTheme lerp(
      covariant ThemeExtension<ToggleTextButtonTheme>? other, double t) {
    if (other is! ToggleTextButtonTheme) return this as ToggleTextButtonTheme;
    return ToggleTextButtonTheme(
      paddingLarge: t < 0.5 ? paddingLarge : other.paddingLarge,
      paddingMedium: t < 0.5 ? paddingMedium : other.paddingMedium,
      paddingSmall: t < 0.5 ? paddingSmall : other.paddingSmall,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ToggleTextButtonTheme &&
            const DeepCollectionEquality()
                .equals(paddingLarge, other.paddingLarge) &&
            const DeepCollectionEquality()
                .equals(paddingMedium, other.paddingMedium) &&
            const DeepCollectionEquality()
                .equals(paddingSmall, other.paddingSmall));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(paddingLarge),
      const DeepCollectionEquality().hash(paddingMedium),
      const DeepCollectionEquality().hash(paddingSmall),
    );
  }
}
