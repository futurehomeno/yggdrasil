import 'package:yggdrasil_token_parser/theme_builder/src/models/_models.dart';

abstract final class NumberParser {
  const NumberParser._();

  static Result<TokenNumberValue> parse(UnresolvedValue unresolvedValue) {
    final Object value = unresolvedValue.value;
    if (value is! num) {
      throw TokenParseTypeError(
        expectedType: num,
        foundType: value.runtimeType,
      );
    }

    return Result<TokenNumberValue>.data(
      TokenNumberValue(
        number: value.toDouble(),
      ),
    );
  }
}
