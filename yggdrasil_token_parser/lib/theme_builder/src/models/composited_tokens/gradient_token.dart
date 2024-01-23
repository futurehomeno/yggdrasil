// ignore_for_file: avoid-dynamic

import 'package:flutter/material.dart';

import '../../_token_parser.dart';

final class TokenGradient extends TokenValue {
  const TokenGradient({
    super.description,
    required this.gradient,
  });

  factory TokenGradient.fromJson(Map<String, dynamic> json) {
    final String? type = json.safeString(r'$type');

    if (type != typeString) {
      throw TokenParseError(
        type: typeString,
        error: 'TokenGradient tried to parse non $typeString type json object',
        path: <String>[r'$type'],
      );
    }

    final List<dynamic>? values = json.safeValue<List<dynamic>>(r'$value');

    if (values == null || values.length < 2) {
      throw TokenParseError(
        type: typeString,
        error: r'Invalid gradient format or missing $value',
        path: <String>[r'$value'],
      );
    }

    final List<double> stops = <double>[];
    final List<Color> colors = <Color>[];

    for (final dynamic value in values) {
      if (value is! Map<String, dynamic>) {
        throw TokenParseError(
          type: typeString,
          error: r'Invalid gradient format or missing $value',
          path: <String>[r'$value'],
        );
      }

      final double? stop = value.safeValue<num>('position')?.toDouble();
      if (stop == null) {
        throw TokenParseError(
          type: typeString,
          error: r'Invalid gradient position or missing position',
          path: <String>[r'$value'],
        );
      }

      final Color? color = value.safeColor('color');
      if (color == null) {
        throw TokenParseError(
          type: typeString,
          error: r'Invalid gradient format or missing $value',
          path: <String>[r'$value'],
        );
      }

      stops.add(stop);
      colors.add(color);
    }

    return TokenGradient(
      description: json.safeString(r'$description'),
      gradient: LinearGradient(
        colors: colors,
        stops: stops,
      ),
    );
  }

  static const String typeString = 'gradient';

  @override
  final TokenValueType type = TokenValueType.gradient;
  final LinearGradient gradient;
}
