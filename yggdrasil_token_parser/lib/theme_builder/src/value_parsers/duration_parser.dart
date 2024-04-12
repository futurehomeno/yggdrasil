import 'package:yggdrasil_token_parser/theme_builder/src/models/_models.dart';

abstract final class DurationParser {
  const DurationParser._();

  static final RegExp _durationRegex = RegExp(r'^(\d+)ms$');

  static Result<TokenDurationValue> parse(UnresolvedValue unresolvedValue) {
    final Object value = unresolvedValue.value;

    if (value is! String) {
      return Result<TokenDurationValue>.error(
        TokenParseTypeError(
          expectedType: String,
          foundType: value.runtimeType,
        ),
      );
    }

    final RegExpMatch? match = _durationRegex.firstMatch(value);

    if (match == null) {
      return Result<TokenDurationValue>.error(
        TokenParseFormatError(
          data: value,
        ),
      );
    }

    final int? number = int.tryParse(match.group(1) ?? '');

    if (number == null) {
      return Result<TokenDurationValue>.error(
        TokenParseFormatError(
          data: value,
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
