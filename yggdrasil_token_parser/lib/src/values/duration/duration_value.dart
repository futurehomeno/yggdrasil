import 'package:yggdrasil_token_parser/src/_token_parser.dart';

class DurationValue extends TokenValue {
  const DurationValue({
    super.reference,
    required this.milliseconds,
  });

  final int milliseconds;
  final TokenValueType type = TokenValueType.duration;

  @override
  DurationValue getReference(List<String> reference) {
    return DurationValue(
      milliseconds: milliseconds,
      reference: reference,
    );
  }
}
