import 'package:yggdrasil_token_parser/theme_builder/src/models/values/_value.dart';

class TokenShadowValue extends TokenValue {
  const TokenShadowValue({
    super.reference,
    required this.color,
    required this.offsetX,
    required this.offsetY,
    required this.blur,
    required this.spread,
  });

  final TokenColorValue color;
  final TokenDimensionValue offsetX;
  final TokenDimensionValue offsetY;
  final TokenDimensionValue blur;
  final TokenDimensionValue spread;
}
