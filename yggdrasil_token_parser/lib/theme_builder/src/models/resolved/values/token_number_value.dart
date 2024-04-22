import 'package:yggdrasil_token_parser/theme_builder/src/enums/token_value_type.dart';

import '../token_value.dart';

class TokenNumberValue extends TokenValue {
  const TokenNumberValue({
    super.reference,
    required this.number,
  });

  final double number;
  final TokenValueType type = TokenValueType.number;
}
