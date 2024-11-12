import 'package:yggdrasil_token_parser/yggdrasil_token_parser.dart';

class FontWeightValue extends TokenValue {
  const FontWeightValue({
    super.reference,
    required this.weight,
  });

  final TokenFontWeight weight;
  final TokenValueType type = TokenValueType.fontWeight;

  @override
  FontWeightValue getReference(List<String> reference) {
    return FontWeightValue(
      weight: weight,
      reference: reference,
    );
  }
}
