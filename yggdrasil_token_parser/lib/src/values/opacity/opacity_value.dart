import 'package:yggdrasil_token_parser/src/_token_parser.dart';

class OpacityValue extends TokenValue {
  const OpacityValue({
    super.reference,
    required this.opacity,
  });

  final double opacity;
  final TokenValueType type = TokenValueType.opacity;

  @override
  OpacityValue getReference(List<String> reference) {
    return OpacityValue(
      opacity: opacity,
      reference: reference,
    );
  }
}
