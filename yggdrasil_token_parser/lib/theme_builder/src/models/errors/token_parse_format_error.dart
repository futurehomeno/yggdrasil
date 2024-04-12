import 'token_parse_error.dart';

class TokenParseFormatError extends TokenParseError {
  TokenParseFormatError({
    super.path,
    required dynamic data,
  }) : super(
          error: 'Data "$data" does not match the expected format',
        );
}
