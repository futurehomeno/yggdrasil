import 'package:yggdrasil_token_parser/theme_builder/src/enums/_enums.dart';

import '../token_value.dart';

class TokenFontWeightValue extends TokenValue {
  const TokenFontWeightValue({
    super.reference,
    required this.weight,
  });

  final TokenFontWeight weight;
}
