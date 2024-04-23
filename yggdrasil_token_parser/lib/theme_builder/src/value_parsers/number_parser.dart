import 'package:yggdrasil_token_parser/theme_builder/src/models/_models.dart';
import 'package:yggdrasil_token_parser/theme_builder/src/parser/errors/parsing_error.dart';
import 'package:yggdrasil_token_parser/theme_builder/src/parser/parsing_context.dart';

abstract final class NumberParser {
  const NumberParser._();

  static Result<TokenNumberValue> parse(ParsingContext context, Object value) {
    if (value is! num) {
      return Result<TokenNumberValue>.error(
        ParsingError.dataType(
          expected: num,
          actual: value.runtimeType,
          path: <String>[],
        ),
      );
    }

    return Result<TokenNumberValue>.data(
      TokenNumberValue(
        number: value.toDouble(),
      ),
    );
  }
}
