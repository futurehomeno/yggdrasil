import 'package:yggdrasil_token_parser/src/_token_parser.dart';

abstract final class NumberParser {
  const NumberParser._();

  static Result<NumberValue> parse(ParsingContext context, Object value) {
    if (value is! num) {
      return Result<NumberValue>.error(
        ParsingError.dataType(
          expected: num,
          actual: value.runtimeType,
          path: <String>[],
        ),
      );
    }

    return Result<NumberValue>.data(
      NumberValue(
        number: value.toDouble(),
      ),
    );
  }
}
