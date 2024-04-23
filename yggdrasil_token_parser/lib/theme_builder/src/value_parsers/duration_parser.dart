import 'package:yggdrasil_token_parser/theme_builder/src/models/_models.dart';
import 'package:yggdrasil_token_parser/theme_builder/src/parser/errors/parsing_error.dart';
import 'package:yggdrasil_token_parser/theme_builder/src/parser/parsing_context.dart';

abstract final class DurationParser {
  const DurationParser._();

  static final RegExp _durationRegex = RegExp(r'^(\d+)ms$');

  static Result<TokenDurationValue> parse(ParsingContext context, Object value) {
    if (value is! String) {
      return Result<TokenDurationValue>.error(
        ParsingError.dataType(
          expected: String,
          actual: value.runtimeType,
          path: <String>[],
        ),
      );
    }

    final RegExpMatch? match = _durationRegex.firstMatch(value);

    if (match == null) {
      return Result<TokenDurationValue>.error(
        ParsingError.format(
          data: value,
          path: <String>[],
        ),
      );
    }

    final int? number = int.tryParse(match.group(1) ?? '');

    if (number == null) {
      return Result<TokenDurationValue>.error(
        ParsingError.format(
          data: value,
          path: <String>[],
        ),
      );
    }

    return Result<TokenDurationValue>.data(
      TokenDurationValue(
        milliseconds: number,
      ),
    );
  }
}
