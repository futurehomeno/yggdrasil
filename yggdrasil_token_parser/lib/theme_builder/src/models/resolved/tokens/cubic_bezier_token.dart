import 'package:yggdrasil_token_parser/theme_builder/src/_token_parser.dart';
import 'package:yggdrasil_token_parser/theme_builder/src/models/values/_value.dart';

class CubicBezierToken extends Token {
  const CubicBezierToken({
    required this.cubicBezier,
    required super.description,
  });

  final TokenCubicBezierValue cubicBezier;
}
