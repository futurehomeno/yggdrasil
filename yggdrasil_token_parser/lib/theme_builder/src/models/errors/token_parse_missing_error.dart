import 'token_parse_error.dart';

class TokenParseMissingError extends TokenParseError {
  TokenParseMissingError({
    required List<String> path,
  }) : super(
          error: 'Missing property ${path.last}',
          path: path,
        );
}
