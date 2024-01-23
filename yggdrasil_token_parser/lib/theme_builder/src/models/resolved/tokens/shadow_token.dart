import 'package:yggdrasil_token_parser/theme_builder/src/models/primary_tokens/_values.dart';

import '../_resolved.dart';

class ShadowToken extends Token {
  const ShadowToken({
    required super.unresolved,
    required this.color,
    required this.blur,
    required this.offsetX,
    required this.offsetY,
    required this.spread,
    super.description,
  });

  final int color;
  final TokenDimension offsetX;
  final TokenDimension offsetY;
  final TokenDimension blur;
  final TokenDimension spread;
}
