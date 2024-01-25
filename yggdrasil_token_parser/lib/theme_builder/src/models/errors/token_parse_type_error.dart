import 'token_parse_error.dart';

class TokenParseTypeError extends TokenParseError {
  TokenParseTypeError({
    required super.path,
    required Type expectedType,
    required Type foundType,
  }) : super(
          error: 'Expected to find $expectedType but found $foundType instead.',
        );
}
