import 'package:yggdrasil_token_parser/src/enums/_enums.dart';

import '../../models/token_value.dart';

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
