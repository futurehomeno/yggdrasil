import 'package:yggdrasil_token_parser/src/_token_parser.dart';

class TransitionValue extends TokenValue {
  const TransitionValue({
    super.reference,
    required this.duration,
    required this.delay,
    required this.timingFunction,
  });

  final DimensionValue duration;
  final DimensionValue delay;
  final CubicBezierValue timingFunction;
  final TokenValueType type = TokenValueType.transition;

  @override
  TransitionValue getReference(List<String> reference) {
    return TransitionValue(
      duration: duration,
      delay: delay,
      timingFunction: timingFunction,
      reference: reference,
    );
  }
}
