import 'package:yggdrasil_token_parser/theme_builder/src/enums/token_value_type.dart';
import 'package:yggdrasil_token_parser/theme_builder/src/models/_models.dart';

class TokenGradientValue extends TokenValue {
  const TokenGradientValue({
    super.reference,
    required this.stops,
  });

  final List<TokenGradientStop> stops;
  final TokenValueType type = TokenValueType.gradient;
}

class TokenGradientStop {
  const TokenGradientStop({
    required this.color,
    required this.position,
  });

  final TokenColorValue color;
  final TokenNumberValue position;
}
