import '../token_value.dart';

class TokenNumberValue extends TokenValue {
  const TokenNumberValue({
    super.reference,
    required this.number,
  });

  final double number;
}
