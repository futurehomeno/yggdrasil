import 'package:yggdrasil_token_parser/src/enums/token_value_type.dart';

import '../../models/token_value.dart';

class NumberValue extends TokenValue {
  const NumberValue({
    super.reference,
    required this.number,
  });

  final double number;
  final TokenValueType type = TokenValueType.number;

  @override
  NumberValue getReference(List<String> reference) {
    return NumberValue(
      number: number,
      reference: reference,
    );
  }
}
