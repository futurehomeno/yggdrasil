import '../models/_models.dart';

extension TokenParseErrorListExtension on List<TokenParseError> {
  void addAllWithPath(List<String> path, List<TokenParseError> errors) {
    addAll(errors.map((TokenParseError error) => error.copyWithPath(path)));
  }
}
