// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'toggle_icon_text_button_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class ToggleIconTextButtonTheme extends ThemeExtension<ToggleIconTextButtonTheme> {
  const ToggleIconTextButtonTheme({
    required this.paddingLarge,
    required this.paddingMedium,
    required this.paddingSmall,
  });

  final EdgeInsets paddingLarge;
  final EdgeInsets paddingMedium;
  final EdgeInsets paddingSmall;

  static final ToggleIconTextButtonTheme consumerLight = ToggleIconTextButtonTheme(
    paddingLarge: _$ToggleIconTextButtonTheme.paddingLarge[0],
    paddingMedium: _$ToggleIconTextButtonTheme.paddingMedium[0],
    paddingSmall: _$ToggleIconTextButtonTheme.paddingSmall[0],
  );

  static final ToggleIconTextButtonTheme consumerDark = ToggleIconTextButtonTheme(
    paddingLarge: _$ToggleIconTextButtonTheme.paddingLarge[1],
    paddingMedium: _$ToggleIconTextButtonTheme.paddingMedium[1],
    paddingSmall: _$ToggleIconTextButtonTheme.paddingSmall[1],
  );

  static final ToggleIconTextButtonTheme professionalLight = ToggleIconTextButtonTheme(
    paddingLarge: _$ToggleIconTextButtonTheme.paddingLarge[2],
    paddingMedium: _$ToggleIconTextButtonTheme.paddingMedium[2],
    paddingSmall: _$ToggleIconTextButtonTheme.paddingSmall[2],
  );

  static final ToggleIconTextButtonTheme professionalDark = ToggleIconTextButtonTheme(
    paddingLarge: _$ToggleIconTextButtonTheme.paddingLarge[3],
    paddingMedium: _$ToggleIconTextButtonTheme.paddingMedium[3],
    paddingSmall: _$ToggleIconTextButtonTheme.paddingSmall[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  ToggleIconTextButtonTheme copyWith({
    EdgeInsets? paddingLarge,
    EdgeInsets? paddingMedium,
    EdgeInsets? paddingSmall,
  }) {
    return ToggleIconTextButtonTheme(
      paddingLarge: paddingLarge ?? this.paddingLarge,
      paddingMedium: paddingMedium ?? this.paddingMedium,
      paddingSmall: paddingSmall ?? this.paddingSmall,
    );
  }

  @override
  ToggleIconTextButtonTheme lerp(covariant ThemeExtension<ToggleIconTextButtonTheme>? other, double t) {
    if (other is! ToggleIconTextButtonTheme) return this as ToggleIconTextButtonTheme;
    return ToggleIconTextButtonTheme(
      paddingLarge: t < 0.5 ? paddingLarge : other.paddingLarge,
      paddingMedium: t < 0.5 ? paddingMedium : other.paddingMedium,
      paddingSmall: t < 0.5 ? paddingSmall : other.paddingSmall,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ToggleIconTextButtonTheme &&
            const DeepCollectionEquality().equals(paddingLarge, other.paddingLarge) &&
            const DeepCollectionEquality().equals(paddingMedium, other.paddingMedium) &&
            const DeepCollectionEquality().equals(paddingSmall, other.paddingSmall));
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
