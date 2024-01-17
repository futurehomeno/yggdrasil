// ignore_for_file: avoid-dynamic

import 'package:flutter/material.dart';

typedef ThemeParser<T extends ThemeExtension<T>> = T Function(Map<String, dynamic> json, T baseTheme);

extension JsonThemeExtension on Map<String, dynamic> {
  T? safeValue<T>(String name) {
    final dynamic value = this[name];

    if (value is T) {
      return value;
    }

    return null;
  }

  T parseWith<T extends ThemeExtension<T>>(String name, T baseTheme, ThemeParser<T> parser) {
    final Map<String, dynamic>? value = safeValue(name);

    if (value == null) {
      return baseTheme;
    }

    return parser(value, baseTheme);
  }

  static final RegExp _hexColorRegex = RegExp(r'^#([0-9a-f]{2})?([0-9a-f]{6})$');
  static final RegExp _rgbaColorRegex =
      RegExp(r'^rgba\(\s*(\d{1,3})\s*,\s*(\d{1,3})\s*,\s*(\d{1,3})\s*,\s*(\d(\.\d*)?)\)$');
  static final RegExp _rgbColorRegex = RegExp(r'^rgb\(\s*(\d{1,3})\s*,\s*(\d{1,3})\s*,\s*(\d{1,3})\s*\)$');

  /// Currently supports hex colors, rgba and rgb, all based on the css spec.
  Color? safeColor(String name) {
    final dynamic value = this[name];

    if (value is! String) {
      return null;
    }

    final RegExpMatch? hexMatch = _hexColorRegex.firstMatch(value);
    if (hexMatch != null) {
      final String? transparencyHex = hexMatch.group(1);
      final String? colorHex = hexMatch.group(2);

      if (colorHex == null) {
        return null;
      }

      int? color = int.tryParse(colorHex, radix: 16);

      if (color == null) {
        return null;
      }

      if (transparencyHex != null) {
        final int? transparency = int.tryParse(transparencyHex);

        if (transparency == null) {
          return null;
        }

        color |= transparency << 24;
      } else {
        color |= 0xff000000;
      }
    }

    final RegExpMatch? rgbaMatch = _rgbaColorRegex.firstMatch(value);
    if (rgbaMatch != null) {
      final int? r = int.tryParse(rgbaMatch.group(1) ?? '');
      final int? g = int.tryParse(rgbaMatch.group(2) ?? '');
      final int? b = int.tryParse(rgbaMatch.group(3) ?? '');
      final double? a = double.tryParse(rgbaMatch.group(4) ?? '');

      if (r == null || g == null || b == null || a == null) {
        return null;
      }

      return Color.fromRGBO(r, g, b, a);
    }

    final RegExpMatch? rgbMatch = _rgbColorRegex.firstMatch(value);
    if (rgbMatch != null) {
      final int? r = int.tryParse(rgbMatch.group(1) ?? '');
      final int? g = int.tryParse(rgbMatch.group(2) ?? '');
      final int? b = int.tryParse(rgbMatch.group(3) ?? '');

      if (r == null || g == null || b == null) {
        return null;
      }

      return Color.fromRGBO(r, g, b, 1);
    }

    return null;
  }
}
