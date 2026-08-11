import 'package:yggdrasil_token_parser/src/_token_parser.dart';

abstract final class DimensionParser {
  const DimensionParser._();

  static final RegExp _regex = RegExp(r'^(\d+(\.\d+)?|\.\d+)(px|rem)$');

  static Result<DimensionValue> parse(ParsingContext context, Object value) {
    if (value is! String) {
      return Result<DimensionValue>.error(
        ParsingError.dataType(
          expected: String,
          actual: value.runtimeType,
          path: <String>[],
        ),
      );
    }

    final RegExpMatch? match = _regex.firstMatch(value);

    if (match == null) {
      return Result<DimensionValue>.error(
        ParsingError.format(
          data: value,
          path: <String>[],
        ),
      );
    }

    final double? number = double.tryParse(match.group(1) ?? '');
    final bool rem = (match.group(3) ?? '') == 'rem';

    if (number == null) {
      return Result<DimensionValue>.error(
        ParsingError.format(
          data: value,
          path: <String>[],
        ),
      );
    }

    return Result<DimensionValue>.data(
      DimensionValue(
        rem: rem,
        value: number,
      ),
    );
  }
}
