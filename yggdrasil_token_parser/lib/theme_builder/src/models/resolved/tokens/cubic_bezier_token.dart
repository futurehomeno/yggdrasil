import 'package:yggdrasil_token_parser/theme_builder/src/_token_parser.dart';

import '../_resolved.dart';

class CubicBezierToken extends Token {
  const CubicBezierToken({
    required super.unresolved,
    required this.cubicBezier,
    super.description,
  });

  final TokenCubicBezier cubicBezier;
}
