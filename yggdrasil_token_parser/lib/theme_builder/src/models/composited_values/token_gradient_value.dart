import 'package:yggdrasil_token_parser/theme_builder/src/models/values/_value.dart';

class TokenGradientValue extends TokenValue {
  const TokenGradientValue({
    super.reference,
    required this.stops,
  });

  final List<TokenGradientStop> stops;
}

class TokenGradientStop {
  const TokenGradientStop({
    required this.color,
    required this.position,
  });

  final TokenColorValue color;
  final TokenNumberValue position;
}
