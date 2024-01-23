import 'package:yggdrasil_token_parser/theme_builder/src/models/primary_tokens/_values.dart';

import '../_resolved.dart';

class TransitionToken extends Token {
  const TransitionToken({
    required super.unresolved,
    required this.duration,
    required this.curve,
    required this.delay,
    super.description,
  });

  final int duration;
  final int delay;
  final TokenCubicBezier curve;
}
