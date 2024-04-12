import 'token_value.dart';

class TokenColorValue extends TokenValue {
  const TokenColorValue({
    super.reference,
    required this.color,
  });

  final int color;
}
