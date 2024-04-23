import 'package:yggdrasil_token_parser/theme_builder/src/models/_models.dart';
import 'package:yggdrasil_token_parser/theme_builder/src/parser/errors/parsing_error.dart';
import 'package:yggdrasil_token_parser/theme_builder/src/parser/parsing_context.dart';

abstract final class CubicBezierParser {
  const CubicBezierParser._();

  static Result<TokenCubicBezierValue> parse(ParsingContext context, Object value) {
    if (value is! List) {
      return Result<TokenCubicBezierValue>.error(
        ParsingError.dataType(
          expected: List,
          actual: value.runtimeType,
          path: <String>[],
        ),
      );
    }

    if (value.length != 4) {
      return Result<TokenCubicBezierValue>.error(
        ParsingError.format(
          data: value,
          path: <String>[],
        ),
      );
    }

    final List<double> doubles = <double>[];
    for (int i = 0; i < 4; i++) {
      final dynamic entry = value[i];

      if (entry is! double) {
        return Result<TokenCubicBezierValue>.error(
          ParsingError.dataType(
            expected: double,
            actual: entry.runtimeType,
            path: <String>[i.toString()],
          ),
        );
      }

      doubles.add(entry);
    }

    return Result<TokenCubicBezierValue>.data(
      TokenCubicBezierValue(
        a: doubles[0],
        b: doubles[1],
        c: doubles[2],
        d: doubles[3],
      ),
    );
  }
}
