import 'package:yggdrasil_token_parser/theme_builder/src/models/_models.dart';

abstract final class DimensionParser {
  const DimensionParser._();

  static final RegExp _regex = RegExp(r'^(\d+(\.\d+)?|\.\d+)(px|rem)$');

  static Result<TokenDimensionValue> parse(UnresolvedValue unresolvedValue) {
    final Object value = unresolvedValue.value;

    if (value is! String) {
      throw TokenParseTypeError(
        expectedType: String,
        foundType: value.runtimeType,
      );
    }

    final RegExpMatch? match = _regex.firstMatch(value);

    if (match == null) {
      return Result<TokenDimensionValue>.error(
        TokenParseFormatError(
          data: value,
        ),
      );
    }

    final double? number = double.tryParse(match.group(1) ?? '');
    final bool rem = (match.group(3) ?? '') == 'rem';

    if (number == null) {
      return Result<TokenDimensionValue>.error(
        TokenParseFormatError(
          data: value,
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
