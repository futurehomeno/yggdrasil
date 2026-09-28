import 'package:yggdrasil_token_parser/src/_token_parser.dart';
import 'package:yggdrasil_utils/yggdrasil_utils.dart';

abstract final class BorderParser {
  static Result<BorderValue> parse(ParsingContext context, Object value) {
    if (value is! JsonObject) {
      return Result<BorderValue>.error(
        ParsingError.dataType(
          expected: JsonObject,
          actual: value.runtimeType,
          path: <String>[],
        ),
      );
    }

    final Result<ColorValue> colorResult = context.parseOrResolveProperty(
      parser: ColorParser.parse,
      object: value,
      key: BorderKeys.color,
    );
    final Result<DimensionValue> widthResult = context.parseOrResolveProperty(
      parser: DimensionParser.parse,
      object: value,
      key: BorderKeys.width,
    );
    final Result<StrokeStyleValue> styleResult = context.parseOrResolveProperty(
      parser: StrokeStyleParser.parse,
      object: value,
      key: BorderKeys.style,
    );

    final ColorValue? color = colorResult.data;
    final DimensionValue? width = widthResult.data;
    final StrokeStyleValue? style = styleResult.data;

    final List<ParsingError> errors = <ParsingError>[
      ...colorResult.errors,
      ...widthResult.errors,
      ...styleResult.errors,
    ];

    if (color == null || width == null || style == null) {
      return Result<BorderValue>(
        errors: errors,
      );
    }

    return Result<BorderValue>(
      data: BorderValue(
        color: color,
        width: width,
        style: style,
      ),
    );
  }
}
