import 'token_parse_error.dart';

class TokenParseTypeError extends TokenParseError {
  TokenParseTypeError({
    super.path,
    required Type expectedType,
    required Type foundType,
  }) : super(
          error: 'Expected to find $expectedType but found $foundType instead.',
        );

  TokenParseTypeError.multiple({
    super.path,
    required List<Type> expectedTypes,
    required Type foundType,
  }) : super(
          error: 'Expected to find any of ${expectedTypes.join(', ')} but found $foundType instead.',
        );
}
