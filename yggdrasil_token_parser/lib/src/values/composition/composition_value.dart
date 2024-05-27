import 'package:yggdrasil_token_parser/src/_token_parser.dart';

class CompositionValue extends TokenValue {
  CompositionValue({
    super.reference,
    required this.borderRadius,
    required this.border,
    required this.fill,
    required this.shadow,
    required this.gradient,
    required this.opacityValue,
  });

  // Decoration
  final BorderRadiusValue? borderRadius;
  final BorderValue? border;
  final ColorValue? fill;
  final ShadowValue? shadow;
  final GradientValue? gradient;
  final OpacityValue? opacityValue;
  final TokenValueType type = TokenValueType.composition;

  @override
  TokenValue getReference(List<String> reference) {
    return CompositionValue(
      reference: reference,
      borderRadius: borderRadius,
      border: border,
      fill: fill,
      shadow: shadow,
      gradient: gradient,
      opacityValue: opacityValue,
    );
  }
}
