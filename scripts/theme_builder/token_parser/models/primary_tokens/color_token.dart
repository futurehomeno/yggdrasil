import 'dart:ui';

import '../../_token_parser.dart';
import '../values/type_value_or_reference.dart';

final class TokenColor extends TokenValue {
  const TokenColor({
    super.description,
    required this.color,
  });

  factory TokenColor.fromJson(Map<String, dynamic> json) {
    final String? type = json.safeString(r'$type');

    if (type != typeString) {
      throw TokenParseError(
        type: typeString,
        error: 'TokenColor tried to parse non $typeString type json object',
        path: <String>[r'$type'],
      );
    }

    final Color? color = json.safeColor(r'$value');

    if (color == null) {
      throw TokenParseError(
        type: typeString,
        error: r'Invalid color format or missing $value',
        path: <String>[r'$value.color'],
      );
    }

    return TokenColor(
      description: json.safeString(r'$description'),
      color: color,
    );
  }

  final TypeValueOrReference<Color> color;

  static const String typeString = 'color';

  @override
  final TokenValueType type = TokenValueType.color;
}
