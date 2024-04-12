import '../token_value.dart';

class TokenFontFamilyValue extends TokenValue {
  const TokenFontFamilyValue({
    super.reference,
    required this.families,
  });

  final List<String> families;
}
