import 'package:yggdrasil_token_parser/src/_token_parser.dart';

class ColorValue extends TokenValue {
  const ColorValue({
    super.reference,
    required this.color,
  });

  final int color;
  final TokenValueType type = TokenValueType.color;

  @override
  ColorValue getReference(List<String> reference) {
    return ColorValue(
      color: color,
      reference: reference,
    );
  }
}
