// ignore_for_file: avoid-dynamic

import 'package:flutter/material.dart';

import '../token_parse_error.dart';

typedef ThemeParser<T extends ThemeExtension<T>> = T Function(Map<String, dynamic> json, T baseTheme);

extension TokenJsonExtension on Map<String, dynamic> {
  T valueAs<T>(String name) {
    final dynamic value = this[name];

    if (value is! T) {
      throw TokenParseTypeError(
        type: null,
        expectedType: T,
        foundType: value.runtimeType,
      );
    }

    return value;
  }
}
