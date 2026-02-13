import 'package:yggdrasil_token_parser/src/_token_parser.dart';

class CubicBezierValue extends TokenValue {
  const CubicBezierValue({
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
  final TokenValueType type = TokenValueType.cubicBezier;

  @override
  CubicBezierValue getReference(List<String> reference) {
    return CubicBezierValue(
      a: a,
      b: b,
      c: c,
      d: d,
      reference: reference,
    );
  }
}
