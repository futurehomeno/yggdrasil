import 'package:yggdrasil_token_parser/src/_token_parser.dart';

abstract final class DurationParser {
  const DurationParser._();

  static final RegExp _durationRegex = RegExp(r'^(\d+)ms$');

  static Result<DurationValue> parse(ParsingContext context, Object value) {
    if (value is! String) {
      return Result<DurationValue>.error(
        ParsingError.dataType(
          expected: String,
          actual: value.runtimeType,
          path: <String>[],
        ),
      );
    }

    final RegExpMatch? match = _durationRegex.firstMatch(value);

    if (match == null) {
      return Result<DurationValue>.error(
        ParsingError.format(
          data: value,
          path: <String>[],
        ),
      );
    }

    final int? number = int.tryParse(match.group(1) ?? '');

    if (number == null) {
      return Result<DurationValue>.error(
        ParsingError.format(
          data: value,
          path: <String>[],
        ),
      );
    }

    return Result<DurationValue>.data(
      DurationValue(
        milliseconds: number,
      ),
    );
  }
}
