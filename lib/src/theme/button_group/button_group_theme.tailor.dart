// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'button_group_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class YgButtonGroupTheme extends ThemeExtension<YgButtonGroupTheme> {
  const YgButtonGroupTheme({
    required this.buttonSpacing,
  });

  final double buttonSpacing;

  static final YgButtonGroupTheme consumerLight = YgButtonGroupTheme(
    buttonSpacing: _$YgButtonGroupTheme.buttonSpacing[0],
  );

  static final YgButtonGroupTheme consumerDark = YgButtonGroupTheme(
    buttonSpacing: _$YgButtonGroupTheme.buttonSpacing[1],
  );

  static final YgButtonGroupTheme professionalLight = YgButtonGroupTheme(
    buttonSpacing: _$YgButtonGroupTheme.buttonSpacing[2],
  );

  static final YgButtonGroupTheme professionalDark = YgButtonGroupTheme(
    buttonSpacing: _$YgButtonGroupTheme.buttonSpacing[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  YgButtonGroupTheme copyWith({
    double? buttonSpacing,
  }) {
    return YgButtonGroupTheme(
      buttonSpacing: buttonSpacing ?? this.buttonSpacing,
    );
  }

  @override
  YgButtonGroupTheme lerp(covariant ThemeExtension<YgButtonGroupTheme>? other, double t) {
    if (other is! YgButtonGroupTheme) return this as YgButtonGroupTheme;
    return YgButtonGroupTheme(
      buttonSpacing: t < 0.5 ? buttonSpacing : other.buttonSpacing,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is YgButtonGroupTheme &&
            const DeepCollectionEquality().equals(buttonSpacing, other.buttonSpacing));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(buttonSpacing),
    );
  }
}
