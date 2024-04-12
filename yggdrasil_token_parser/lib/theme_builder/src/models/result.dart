import 'package:yggdrasil_token_parser/theme_builder/src/models/_models.dart';

typedef UnresolvedResult = Result<UnresolvedTokenObject>;
typedef ResolvedResult = Result<Map<String, TokenObject>>;

class Result<T> {
  const Result({
    this.errors = const <TokenParseError>[],
    this.data,
  });

  Result.error(TokenParseError error)
      : errors = <TokenParseError>[error],
        data = null;

  const Result.data(T this.data) : errors = const <TokenParseError>[];

  final T? data;
  final List<TokenParseError> errors;
}
