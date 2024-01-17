import '../../_token_parser.dart';

final class TokenDuration extends TokenValue {
  const TokenDuration({
    super.description,
    required this.duration,
  });

  factory TokenDuration.fromJson(Map<String, dynamic> json) {
    final String? type = json.safeString(r'$type');

    if (type != typeString) {
      throw TokenParseError(
        type: typeString,
        error: 'TokenDuration tried to parse non $typeString type json object',
        path: <String>[r'$type'],
      );
    }

    final Duration? duration = json.safeDuration(r'$value');

    if (duration == null) {
      throw TokenParseError(
        type: typeString,
        error: 'Invalid duration format or missing duration value',
        path: <String>[r'$value'],
      );
    }

    return TokenDuration(
      description: json.safeString(r'$description'),
      duration: duration,
    );
  }

  final Duration duration;

  static const String typeString = 'duration';

  @override
  final TokenValueType type = TokenValueType.duration;
}
