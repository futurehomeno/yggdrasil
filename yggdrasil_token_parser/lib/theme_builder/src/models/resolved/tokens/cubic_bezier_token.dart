import 'package:yggdrasil_token_parser/theme_builder/src/_token_parser.dart';

class CubicBezierToken extends Token {
  const CubicBezierToken({
    required super.unresolved,
    required this.cubicBezier,
    required super.description,
  });

  final TokenCubicBezier cubicBezier;
}
