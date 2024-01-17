import '_values.dart';

final class TokenNumber extends TokenValue {
  const TokenNumber({
    super.description,
    required this.number,
  });

  factory TokenBorder.fromJson(Map<String, dynamic> json) {
    return const TokenBorder();
  }

  final double number;
}
