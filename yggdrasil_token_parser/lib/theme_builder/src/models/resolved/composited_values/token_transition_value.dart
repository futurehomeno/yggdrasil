import 'package:yggdrasil_token_parser/theme_builder/src/enums/token_value_type.dart';
import 'package:yggdrasil_token_parser/theme_builder/src/models/_models.dart';

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
  final TokenValueType type = TokenValueType.transition;
}
