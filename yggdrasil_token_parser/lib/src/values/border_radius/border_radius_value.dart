import 'package:yggdrasil_token_parser/src/_token_parser.dart';

class BorderRadiusValue extends TokenValue {
  const BorderRadiusValue({
    super.reference,
    required this.topLeft,
    required this.topRight,
    required this.bottomRight,
    required this.bottomLeft,
  });

  final DimensionValue topLeft;
  final DimensionValue topRight;
  final DimensionValue bottomRight;
  final DimensionValue bottomLeft;
  final TokenValueType type = TokenValueType.borderRadius;

  @override
  BorderRadiusValue getReference(List<String> reference) {
    return BorderRadiusValue(
      reference: reference,
      topLeft: topLeft,
      topRight: topRight,
      bottomRight: bottomRight,
      bottomLeft: bottomLeft,
    );
  }
}
