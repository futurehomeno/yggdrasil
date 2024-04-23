import 'package:yggdrasil_token_parser/theme_builder/src/models/_models.dart';
import 'package:yggdrasil_token_parser/theme_builder/src/parser/errors/parsing_error.dart';
import 'package:yggdrasil_token_parser/theme_builder/src/parser/parsing_context.dart';

abstract final class DimensionParser {
  const DimensionParser._();

  static final RegExp _regex = RegExp(r'^(\d+(\.\d+)?|\.\d+)(px|rem)$');

  static Result<TokenDimensionValue> parse(ParsingContext context, Object value) {
    if (value is! String) {
      return Result<TokenDimensionValue>.error(
        ParsingError.dataType(
          expected: String,
          actual: value.runtimeType,
          path: <String>[],
        ),
      );
    }

    final RegExpMatch? match = _regex.firstMatch(value);

    if (match == null) {
      return Result<TokenDimensionValue>.error(
        ParsingError.format(
          data: value,
          path: <String>[],
        ),
      );
    }

    final double? number = double.tryParse(match.group(1) ?? '');
    final bool rem = (match.group(3) ?? '') == 'rem';

    if (number == null) {
      return Result<TokenDimensionValue>.error(
        ParsingError.format(
          data: value,
          path: <String>[],
        ),
      );
    }

    return Result<TokenDimensionValue>.data(
      TokenDimensionValue(
        rem: rem,
        value: number,
      ),
    );
  }
}
