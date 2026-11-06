import 'package:yggdrasil_token_parser/src/_token_parser.dart';

class FontFamilyValue extends TokenValue {
  const FontFamilyValue({
    super.reference,
    required this.families,
  });

  final List<String> families;
  final TokenValueType type = TokenValueType.fontFamily;

  @override
  FontFamilyValue getReference(List<String> reference) {
    return FontFamilyValue(
      families: families,
      reference: reference,
    );
  }
}
