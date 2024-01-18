import '../../_token_parser.dart';

abstract base class TokenValue extends TokenObject {
  const TokenValue({
    required this.description,
  });

  final String? description;

  TokenValueType get type;

  @override
  bool isStructurallyIdentical(TokenObject other) {
    return other is TokenValue;
  }
}
