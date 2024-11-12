import 'package:yggdrasil_token_parser/src/_token_parser.dart';

class BorderValue extends TokenValue {
  const BorderValue({
    super.reference,
    required this.color,
    required this.width,
    required this.style,
  });

  final ColorValue color;
  final DimensionValue width;
  final StrokeStyleValue style;
  final TokenValueType type = TokenValueType.border;

  @override
  BorderValue getReference(List<String> reference) {
    return BorderValue(
      color: color,
      width: width,
      style: style,
      reference: reference,
    );
  }
}
