import '../../_token_parser.dart';

final class TokenFontFamily extends TokenValue {
  const TokenFontFamily({
    super.description,
    required this.family,
  });

  factory TokenFontFamily.fromJson(Map<String, dynamic> json) {
    final String? type = json.safeString(r'$type');

    if (type != typeString) {
      throw TokenParseError(
        type: typeString,
        error: 'TokenFontFamily tried to parse non $typeString type json object',
        path: <String>[r'$type'],
      );
    }

    final String? family = json.safeString(r'$value');

    if (family == null) {
      throw TokenParseError(
        type: typeString,
        error: r'Invalid value type or missing $value',
        path: <String>[r'$value'],
      );
    }

    return TokenFontFamily(
      description: json.safeString(r'$description'),
      family: family,
    );
  }

  final String family;

  static const String typeString = 'fontFamily';

  @override
  final TokenValueType type = TokenValueType.fontFamily;
}
