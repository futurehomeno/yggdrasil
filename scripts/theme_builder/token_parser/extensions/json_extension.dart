// ignore_for_file: avoid-dynamic

import 'package:flutter/material.dart';

import '_extensions.dart';

typedef ThemeParser<T extends ThemeExtension<T>> = T Function(Map<String, dynamic> json, T baseTheme);

extension JsonExtension on Map<String, dynamic> {
  T? safeValue<T>(String name) {
    final dynamic value = this[name];

    if (value is T) {
      return value;
    }

    return null;
  }

  String? safeString(String name) => safeValue(name);

  Map<String, dynamic>? safeMap(String name) => safeValue(name);

  BorderStyle? safeBorderStyle(String name) => BorderStyle.values.safeByName(safeString(name));

  static final RegExp _hexColorRegex = RegExp(r'^#([0-9a-f]{2})?([0-9a-f]{6})$');

  /// Currently supports hex colors, rgba and rgb, all based on the css spec.
  Color? safeColor(String name) {
    final String? value = safeValue(name);

    if (value == null) {
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

    return null;
  }

  static final RegExp _dimensionRegex = RegExp(r'^(\d+(\.\d+)?|\.\d+)(px|rem)$');

  double? safeDimension(String name) {
    final String? value = safeValue(name);

    if (value == null) {
      return null;
    }

    final RegExpMatch? match = _dimensionRegex.firstMatch(value);

    if (match == null) {
      return null;
    }

    final double? number = double.tryParse(match.group(1) ?? '');
    final int scaleFactor = (match.group(3) ?? '') == 'rem' ? 16 : 1;

    if (number == null) {
      return null;
    }

    return number * scaleFactor;
  }

  static final RegExp _durationRegex = RegExp(r'^(\d+)ms$');

  Duration? safeDuration(String name) {
    final String? value = safeValue(name);

    if (value == null) {
      return null;
    }

    final RegExpMatch? match = _durationRegex.firstMatch(value);

    if (match == null) {
      return null;
    }

    final int? number = int.tryParse(match.group(1) ?? '');

    if (number == null) {
      return null;
    }

    return Duration(milliseconds: number);
  }

  static final Map<int, FontWeight> fontWeightNumberMap = <int, FontWeight>{
    100: FontWeight.w100,
    200: FontWeight.w200,
    300: FontWeight.w300,
    400: FontWeight.w400,
    500: FontWeight.w500,
    600: FontWeight.w600,
    700: FontWeight.w700,
    800: FontWeight.w800,
    900: FontWeight.w900,
    950: FontWeight.w900, // Flutter does not support FontWeight.w950.
  };

  static final Map<String, FontWeight> fontWeightNameMap = <String, FontWeight>{
    'thin': FontWeight.w100,
    'hairline': FontWeight.w100,
    'extra-light': FontWeight.w200,
    'ultra-light': FontWeight.w200,
    'light': FontWeight.w300,
    'normal': FontWeight.w400,
    'regular': FontWeight.w400,
    'book': FontWeight.w400,
    'medium': FontWeight.w500,
    'semi-bold': FontWeight.w600,
    'demi-bold': FontWeight.w600,
    'bold': FontWeight.w700,
    'extra-bold': FontWeight.w800,
    'ultra-bold': FontWeight.w800,
    'black': FontWeight.w900,
    'heavy': FontWeight.w900,
    'extra-black': FontWeight.w900,
    'ultra-black': FontWeight.w900,
  };

  FontWeight? safeFontWeight(String name) {
    final dynamic value = this[name];

    if (value is String) {
      return fontWeightNameMap[value];
    } else if (value is num) {
      return fontWeightNumberMap[value.toInt()];
    }

    return null;
  }
}
