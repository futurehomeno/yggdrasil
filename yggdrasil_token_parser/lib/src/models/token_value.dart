import 'package:yggdrasil_token_parser/src/enums/_enums.dart';

abstract class TokenValue {
  const TokenValue({
    required this.reference,
  });

  final List<String>? reference;

  TokenValueType get type;

  TokenValue getReference(List<String> reference);
}
