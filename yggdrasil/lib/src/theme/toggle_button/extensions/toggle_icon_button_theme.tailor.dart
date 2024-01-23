// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'toggle_icon_button_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class ToggleIconButtonTheme extends ThemeExtension<ToggleIconButtonTheme> {
  const ToggleIconButtonTheme({
    required this.paddingLarge,
    required this.paddingMedium,
    required this.paddingSmall,
  });

  final EdgeInsets paddingLarge;
  final EdgeInsets paddingMedium;
  final EdgeInsets paddingSmall;

  static final ToggleIconButtonTheme consumerLight = ToggleIconButtonTheme(
    paddingLarge: _$ToggleIconButtonTheme.paddingLarge[0],
    paddingMedium: _$ToggleIconButtonTheme.paddingMedium[0],
    paddingSmall: _$ToggleIconButtonTheme.paddingSmall[0],
  );

  static final ToggleIconButtonTheme consumerDark = ToggleIconButtonTheme(
    paddingLarge: _$ToggleIconButtonTheme.paddingLarge[1],
    paddingMedium: _$ToggleIconButtonTheme.paddingMedium[1],
    paddingSmall: _$ToggleIconButtonTheme.paddingSmall[1],
  );

  static final ToggleIconButtonTheme professionalLight = ToggleIconButtonTheme(
    paddingLarge: _$ToggleIconButtonTheme.paddingLarge[2],
    paddingMedium: _$ToggleIconButtonTheme.paddingMedium[2],
    paddingSmall: _$ToggleIconButtonTheme.paddingSmall[2],
  );

  static final ToggleIconButtonTheme professionalDark = ToggleIconButtonTheme(
    paddingLarge: _$ToggleIconButtonTheme.paddingLarge[3],
    paddingMedium: _$ToggleIconButtonTheme.paddingMedium[3],
    paddingSmall: _$ToggleIconButtonTheme.paddingSmall[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  ToggleIconButtonTheme copyWith({
    EdgeInsets? paddingLarge,
    EdgeInsets? paddingMedium,
    EdgeInsets? paddingSmall,
  }) {
    return ToggleIconButtonTheme(
      paddingLarge: paddingLarge ?? this.paddingLarge,
      paddingMedium: paddingMedium ?? this.paddingMedium,
      paddingSmall: paddingSmall ?? this.paddingSmall,
    );
  }

  @override
  ToggleIconButtonTheme lerp(
      covariant ThemeExtension<ToggleIconButtonTheme>? other, double t) {
    if (other is! ToggleIconButtonTheme) return this as ToggleIconButtonTheme;
    return ToggleIconButtonTheme(
      paddingLarge: t < 0.5 ? paddingLarge : other.paddingLarge,
      paddingMedium: t < 0.5 ? paddingMedium : other.paddingMedium,
      paddingSmall: t < 0.5 ? paddingSmall : other.paddingSmall,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ToggleIconButtonTheme &&
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
