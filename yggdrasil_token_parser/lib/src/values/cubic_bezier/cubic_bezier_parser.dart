import 'package:yggdrasil_token_parser/src/_token_parser.dart';

abstract final class CubicBezierParser {
  const CubicBezierParser._();

  static Result<CubicBezierValue> parse(ParsingContext context, Object value) {
    if (value is! List) {
      return Result<CubicBezierValue>.error(
        ParsingError.dataType(
          expected: List,
          actual: value.runtimeType,
          path: <String>[],
        ),
      );
    }

    if (value.length != 4) {
      return Result<CubicBezierValue>.error(
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
        return Result<CubicBezierValue>.error(
          ParsingError.dataType(
            expected: double,
            actual: entry.runtimeType,
            path: <String>[i.toString()],
          ),
        );
      }

      doubles.add(entry);
    }

    return Result<CubicBezierValue>.data(
      CubicBezierValue(
        a: doubles[0],
        b: doubles[1],
        c: doubles[2],
        d: doubles[3],
      ),
    );
  }
}
