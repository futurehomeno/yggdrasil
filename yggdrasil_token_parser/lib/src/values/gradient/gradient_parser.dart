import 'package:yggdrasil_token_parser/src/_token_parser.dart';
import 'package:yggdrasil_utils/yggdrasil_utils.dart';

abstract final class GradientParser {
  const GradientParser._();

  static Result<GradientValue> parse(ParsingContext context, Object value) {
    if (value is! List) {
      return Result<GradientValue>.error(
        ParsingError.dataType(
          expected: List,
          actual: value.runtimeType,
          path: <String>[],
        ),
      );
    }

    final List<GradientStop> stops = <GradientStop>[];
    final List<ParsingError> errors = <ParsingError>[];

    for (int i = 0; i < value.length; i++) {
      final Object? entry = value[i];

      if (entry is! JsonObject) {
        errors.add(
          ParsingError.dataType(
            expected: JsonObject,
            actual: value.runtimeType,
            path: <String>[],
          ),
        );
        continue;
      }

      final Result<ColorValue> colorResult = context.parseOrResolveProperty(
        parser: ColorParser.parse,
        object: entry,
        key: GradientKeys.color,
      );
      final Result<NumberValue> positionResult = context.parseOrResolveProperty(
        parser: NumberParser.parse,
        object: entry,
        key: GradientKeys.position,
      );

      final ColorValue? color = colorResult.data;
      final NumberValue? position = positionResult.data;

      errors.addAll(<ParsingError>[
        ...colorResult.errorsWithKey(i.toString()),
        ...positionResult.errorsWithKey(i.toString()),
      ]);

      if (color == null || position == null) {
        continue;
      }

      stops.add(
        GradientStop(
          color: color,
          position: position,
        ),
      );
    }

    if (stops.isEmpty) {
      return Result<GradientValue>(
        errors: errors,
      );
    }

    return Result<GradientValue>(
      data: GradientValue(stops: stops),
      errors: errors,
    );
  }
}
