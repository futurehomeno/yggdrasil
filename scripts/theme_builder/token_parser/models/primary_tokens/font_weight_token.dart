import 'package:flutter/material.dart';

import '../../_token_parser.dart';

final class TokenFontWeight extends TokenValue {
  const TokenFontWeight({
    super.description,
    required this.fontWeight,
  });

  factory TokenFontWeight.fromJson(Map<String, dynamic> json) {
    final String? type = json.safeString(r'$type');

    if (type != typeString) {
      throw TokenParseError(
        type: typeString,
        error: 'TokenFontWeight tried to parse non $typeString type json object',
        path: <String>[r'$type'],
      );
    }

    final FontWeight? fontWeight = json.safeFontWeight(r'$value');

    if (fontWeight == null) {
      throw TokenParseError(
        type: typeString,
        error: 'Invalid font weight format or missing font weight value',
        path: <String>[r'$value'],
      );
    }

    return TokenFontWeight(
      description: json.safeString(r'$description'),
      fontWeight: fontWeight,
    );
  }

  final FontWeight fontWeight;

  static const String typeString = 'fontWeight';

  @override
  final TokenValueType type = TokenValueType.fontWeight;
}
