import '../models/_models.dart';

extension ParsingErrorListExtension on List<ParsingError> {
  void addAllWithPath(List<String> path, List<ParsingError> errors) {
    addAll(errors.map((ParsingError error) => error.copyWithPath(path)));
  }
}
