import '../token_value.dart';

class TokenDurationValue extends TokenValue {
  const TokenDurationValue({
    super.reference,
    required this.milliseconds,
  });

  final int milliseconds;
}
