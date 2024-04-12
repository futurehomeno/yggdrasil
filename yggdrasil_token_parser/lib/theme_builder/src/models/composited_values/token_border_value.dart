import 'package:yggdrasil_token_parser/theme_builder/src/models/composited_values/_composited_values.dart';
import 'package:yggdrasil_token_parser/theme_builder/src/models/values/_value.dart';

class TokenBorderValue extends TokenValue {
  const TokenBorderValue({
    super.reference,
    required this.color,
    required this.width,
    required this.style,
  });

  final TokenColorValue color;
  final TokenDimensionValue width;
  final TokenStrokeStyleValue style;
}
