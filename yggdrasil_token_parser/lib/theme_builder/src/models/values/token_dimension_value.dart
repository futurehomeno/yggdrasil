import 'package:yggdrasil_token_parser/theme_builder/src/models/_models.dart';

import 'token_value.dart';

class TokenDimensionValue extends TokenValue {
  const TokenDimensionValue({
    super.reference,
    required this.rem,
    required this.value,
  });

  final double value;
  final bool rem;
}
