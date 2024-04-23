import 'package:yggdrasil_token_parser/theme_builder/src/enums/token_value_type.dart';

import '../token_value.dart';

class TokenFontFamilyValue extends TokenValue {
  const TokenFontFamilyValue({
    super.reference,
    required this.families,
  });

  final List<String> families;
  final TokenValueType type = TokenValueType.fontFamily;

  @override
  TokenFontFamilyValue getReference(List<String> reference) {
    return TokenFontFamilyValue(
      families: families,
      reference: reference,
    );
  }
}
