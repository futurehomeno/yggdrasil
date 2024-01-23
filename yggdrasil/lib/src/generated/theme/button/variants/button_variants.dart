import 'package:flutter/material.dart';
import 'package:yggdrasil/src/generated/theme/button/variants/button_variant_primary.dart';

class ButtonVariants extends ThemeExtension<ButtonVariants> {
  const ButtonVariants({
    required this.primary,
  });

  final ButtonVariantPrimary primary;

  @override
  ThemeExtension<ButtonVariants> copyWith({
    ButtonVariantPrimary? primary,
  }) {
    return ButtonVariants(
      primary: primary ?? this.primary,
    );
  }

  @override
  ButtonVariants lerp(covariant ThemeExtension<ButtonVariants>? other, double t) {
    if (other is! ButtonVariants) return this;

    return ButtonVariants(
      primary: primary.lerp(other.primary, t),
    );
  }
}
