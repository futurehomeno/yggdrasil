import 'package:flutter/material.dart';

import '../../_token_parser.dart';

final class TokenBorder extends TokenValue {
  const TokenBorder({
    super.description,
    required this.borderSide,
  });

  factory TokenBorder.fromJson(Map<String, dynamic> json) {
    final String? type = json.safeString('type');

    if (type != typeString) {
      throw TokenParseError(
        type: typeString,
        error: 'TokenBorder tried to parse non border type json object',
        path: <String>[r'$type'],
      );
    }

    final Map<String, dynamic>? value = json.safeMap('type');

    if (value == null) {
      throw TokenParseError(
        type: typeString,
        error: 'Field \$value is not an object or is missing.',
        path: <String>[r'$value'],
      );
    }

    final Color? color = value.safeColor('color');

    if (color == null) {
      throw TokenParseError(
        type: typeString,
        error: 'Invalid color format or missing color',
        path: <String>[r'$value.color'],
      );
    }

    final BorderStyle? style = value.safeBorderStyle('style');

    if (style == null) {
      throw TokenParseError(
        type: typeString,
        error: 'Invalid style format or missing style',
        path: <String>[r'$value.style'],
      );
    }

    final double? width = value.safeDimension('width');

    if (width == null) {
      throw TokenParseError(
        type: typeString,
        error: 'Invalid width format or missing width',
        path: <String>[r'$value.width'],
      );
    }

    return TokenBorder(
      description: json.safeString(r'$description'),
      borderSide: BorderSide(
        color: color,
        style: style,
        width: width,
      ),
    );
  }

  static const String typeString = 'border';

  final BorderSide borderSide;

  @override
  final TokenValueType type = TokenValueType.border;
}
