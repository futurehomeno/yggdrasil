import 'package:yggdrasil_token_parser/src/_token_parser.dart';

class ShadowValue extends TokenValue {
  const ShadowValue({
    super.reference,
    required this.color,
    required this.offsetX,
    required this.offsetY,
    required this.blur,
    required this.spread,
  });

  final ColorValue color;
  final DimensionValue offsetX;
  final DimensionValue offsetY;
  final DimensionValue blur;
  final DimensionValue spread;
  final TokenValueType type = TokenValueType.shadow;

  @override
  ShadowValue getReference(List<String> reference) {
    return ShadowValue(
      color: color,
      offsetX: offsetX,
      offsetY: offsetY,
      blur: blur,
      spread: spread,
      reference: reference,
    );
  }
}
