import '../../_token_parser.dart';

final class TokenDimension extends TokenValue {
  const TokenDimension({
    super.description,
    required this.dimension,
  });

  factory TokenDimension.fromJson(Map<String, dynamic> json) {
    final String? type = json.safeString(r'$type');

    if (type != typeString) {
      throw TokenParseError(
        type: typeString,
        error: 'TokenCubicBezier tried to parse non $typeString type json object',
        path: <String>[r'$type'],
      );
    }

    final double? dimension = json.safeDimension(r'$value');

    if (dimension == null) {
      throw TokenParseError(
        type: typeString,
        error: r'Invalid dimension format or missing $value',
        path: <String>[r'$value'],
      );
    }

    return TokenDimension(
      dimension: dimension,
    );
  }

  final double dimension;

  static const String typeString = 'dimension';

  @override
  final TokenValueType type = TokenValueType.cubicBezier;
}
