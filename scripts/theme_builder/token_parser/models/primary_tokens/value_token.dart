import '../../_token_parser.dart';
import '../token.dart';
import '../values/type_value_or_reference.dart';

final class ValueToken<T> extends Token<T> {
  const ValueToken({
    required super.description,
    required this.value,
  });

  final TypeValueOrReference<T> value;

  @override
  TokenValueType get type => value.type;

  @override
  T resolve() {
    return value.resolve();
  }

  @override
  bool isStructurallyIdentical(TokenObject other) {
    return other is ValueToken;
  }
}
