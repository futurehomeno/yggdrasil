import 'package:yggdrasil_token_parser/theme_builder/src/models/_models.dart';
import 'package:yggdrasil_token_parser/theme_builder/src/parser/errors/parsing_error.dart';

typedef UnresolvedResult = Result<UnresolvedTokenObject>;
typedef ResolvedResult = Result<Map<String, TokenObject>>;

class Result<T> {
  const Result({
    this.errors = const <ParsingError>[],
    this.data,
  });

  Result.error(ParsingError error)
      : errors = <ParsingError>[error],
        data = null;

  const Result.data(T this.data) : errors = const <ParsingError>[];

  final T? data;
  final List<ParsingError> errors;

  List<ParsingError> errorsWithPath(List<String> path) {
    final List<ParsingError> newErrors = <ParsingError>[];

    for (final ParsingError error in errors) {
      newErrors.add(error.copyWithPath(path));
    }

    return newErrors;
  }

  List<ParsingError> errorsWithKey(String key) {
    final List<ParsingError> newErrors = <ParsingError>[];

    for (final ParsingError error in errors) {
      newErrors.add(error.copyWithKey(key));
    }

    return newErrors;
  }
}
