import 'package:yggdrasil_token_parser/theme_builder/src/enums/token_value_type.dart';

import '../token_value.dart';

class TokenColorValue extends TokenValue {
  const TokenColorValue({
    super.reference,
    required this.color,
  });

  final int color;
  final TokenValueType type = TokenValueType.color;

  @override
  TokenColorValue getReference(List<String> reference) {
    return TokenColorValue(
      color: color,
      reference: reference,
    );
  }
}
