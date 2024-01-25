import 'package:flutter/material.dart';
import 'package:yggdrasil/src/generated/theme/button/yg_button_theme.dart';
import 'package:yggdrasil_utils/yggdrasil_utils.dart';

class YgTheme extends ThemeExtension<YgTheme> {
  const YgTheme({
    required this.buttonTheme,
  });

  final YgButtonTheme buttonTheme;

  static YgTheme? fromJson(Map<String, dynamic> json) {
    final String? baseThemeName = json.safeValue('baseTheme');
    final Map<String, dynamic>? data = json.safeValue('data');

    if (baseThemeName == null || data == null) {
      return null;
    }

    return switch (baseThemeName) {
      'consumerDark' => _fromJson(data, consumerDark),
      'consumerLight' => _fromJson(data, consumerLight),
      'professionalDark' => _fromJson(data, professionalDark),
      'professionalLight' => _fromJson(data, professionalLight),
      _ => null,
    };
  }

  static YgTheme _fromJson(Map<String, dynamic> json, YgTheme baseTheme) {
    return YgTheme(
      buttonTheme: json.parseWith('buttonTheme', baseTheme.buttonTheme, YgButtonTheme.fromJson),
    );
  }

  static const YgTheme consumerDark = YgTheme(
    buttonTheme: YgButtonTheme.consumerDark,
  );

  static const YgTheme consumerLight = YgTheme(
    buttonTheme: YgButtonTheme.consumerLight,
  );

  static const YgTheme professionalDark = YgTheme(
    buttonTheme: YgButtonTheme.professionalDark,
  );

  static const YgTheme professionalLight = YgTheme(
    buttonTheme: YgButtonTheme.professionalLight,
  );

  static YgTheme of(BuildContext context) {
    return Theme.of(context).extension<YgTheme>()!;
  }

  @override
  YgTheme copyWith({
    YgButtonTheme? buttonTheme,
  }) {
    return YgTheme(
      buttonTheme: buttonTheme ?? this.buttonTheme,
    );
  }

  @override
  YgTheme lerp(covariant ThemeExtension<YgTheme>? other, double t) {
    if (other is! YgTheme) return this;

    return YgTheme(
      buttonTheme: buttonTheme.lerp(other.buttonTheme, t),
    );
  }
}
