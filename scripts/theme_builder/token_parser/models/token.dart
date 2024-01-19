import '../_token_parser.dart';

abstract base class Token<T> extends TokenObject {
  const Token({
    this.description,
  });

  final String? description;

  TokenValueType get type;

  T resolve();

  @override
  bool isStructurallyIdentical(TokenObject other) {
    return other is Token;
  }
}
