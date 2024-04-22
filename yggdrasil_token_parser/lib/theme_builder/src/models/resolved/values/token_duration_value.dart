import 'package:yggdrasil_token_parser/theme_builder/src/enums/token_value_type.dart';

import '../token_value.dart';

class TokenDurationValue extends TokenValue {
  const TokenDurationValue({
    super.reference,
    required this.milliseconds,
  });

  final int milliseconds;
  final TokenValueType type = TokenValueType.duration;
}
