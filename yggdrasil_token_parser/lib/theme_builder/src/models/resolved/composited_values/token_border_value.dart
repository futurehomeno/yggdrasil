import 'package:yggdrasil_token_parser/theme_builder/src/enums/_enums.dart';
import 'package:yggdrasil_token_parser/theme_builder/src/models/_models.dart';

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
  final TokenValueType type = TokenValueType.border;

  @override
  TokenBorderValue getReference(List<String> reference) {
    return TokenBorderValue(
      color: color,
      width: width,
      style: style,
      reference: reference,
    );
  }
}
