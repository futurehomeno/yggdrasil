import 'package:yggdrasil_token_parser/src/_token_parser.dart';

class DimensionValue extends TokenValue {
  const DimensionValue({
    super.reference,
    required this.rem,
    required this.value,
  });

  final double value;
  final bool rem;
  final TokenValueType type = TokenValueType.dimension;

  @override
  DimensionValue getReference(List<String> reference) {
    return DimensionValue(
      rem: rem,
      value: value,
      reference: reference,
    );
  }
}
