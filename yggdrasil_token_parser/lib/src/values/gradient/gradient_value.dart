import 'package:yggdrasil_token_parser/src/_token_parser.dart';

class GradientValue extends TokenValue {
  const GradientValue({
    super.reference,
    required this.stops,
  });

  final List<GradientStop> stops;
  final TokenValueType type = TokenValueType.gradient;

  @override
  GradientValue getReference(List<String> reference) {
    return GradientValue(
      stops: stops,
      reference: reference,
    );
  }
}

class GradientStop {
  const GradientStop({
    required this.color,
    required this.position,
  });

  final ColorValue color;
  final NumberValue position;
}
