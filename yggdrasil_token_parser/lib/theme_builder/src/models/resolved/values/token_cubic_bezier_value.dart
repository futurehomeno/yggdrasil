import 'package:yggdrasil_token_parser/theme_builder/src/models/_models.dart';

class TokenCubicBezierValue extends TokenValue {
  const TokenCubicBezierValue({
    super.reference,
    required this.a,
    required this.b,
    required this.c,
    required this.d,
  });

  final double a;
  final double b;
  final double c;
  final double d;
}
