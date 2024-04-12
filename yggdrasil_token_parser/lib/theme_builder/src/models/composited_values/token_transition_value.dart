import 'package:yggdrasil_token_parser/theme_builder/src/models/values/_value.dart';

class TokenTransitionValue extends TokenValue {
  const TokenTransitionValue({
    super.reference,
    required this.duration,
    required this.delay,
    required this.timingFunction,
  });

  final TokenDimensionValue duration;
  final TokenDimensionValue delay;
  final TokenCubicBezierValue timingFunction;
}
