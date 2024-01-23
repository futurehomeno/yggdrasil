import 'package:flutter/widgets.dart';

import '../../_token_parser.dart';

final class TokenCubicBezier extends TokenValue {
  const TokenCubicBezier({
    super.description,
    required this.cubic,
  });

  factory TokenCubicBezier.fromJson(Map<String, dynamic> json) {
    final String? type = json.safeString(r'$type');

    if (type != typeString) {
      throw TokenParseError(
        type: typeString,
        error: 'TokenCubicBezier tried to parse non $typeString type json object',
        path: <String>[r'$type'],
      );
    }

    // ignore: avoid-dynamic
    final List<double>? values = json.safeValue<List<dynamic>>(r'$value')?.whereType<double>().toList();
    if (values == null || values.length != 4) {
      throw TokenParseError(
        type: typeString,
        error: r'Invalid cubic bezier format or missing $value',
        path: <String>[r'$value'],
      );
    }

    return TokenCubicBezier(
      description: json.safeString(r'$description'),
      cubic: Cubic(
        values[0],
        values[1],
        values[2],
        values[3],
      ),
    );
  }

  final Cubic cubic;

  static const String typeString = 'cubicBezier';

  @override
  final TokenValueType type = TokenValueType.cubicBezier;
}
