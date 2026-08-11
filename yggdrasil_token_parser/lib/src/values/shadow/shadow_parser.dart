import 'package:yggdrasil_token_parser/src/_token_parser.dart';
import 'package:yggdrasil_utils/yggdrasil_utils.dart';

abstract final class ShadowParser {
  const ShadowParser._();

  static Result<ShadowValue> parse(ParsingContext context, Object value) {
    if (value is! JsonObject) {
      return Result<ShadowValue>.error(
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
      key: ShadowKeys.color,
    );
    final Result<DimensionValue> offsetXResult = context.parseOrResolveProperty(
      parser: DimensionParser.parse,
      object: value,
      key: ShadowKeys.offsetX,
    );
    final Result<DimensionValue> offsetYResult = context.parseOrResolveProperty(
      parser: DimensionParser.parse,
      object: value,
      key: ShadowKeys.offsetY,
    );
    final Result<DimensionValue> blurResult = context.parseOrResolveProperty(
      parser: DimensionParser.parse,
      object: value,
      key: ShadowKeys.blur,
    );
    final Result<DimensionValue> spreadResult = context.parseOrResolveProperty(
      parser: DimensionParser.parse,
      object: value,
      key: ShadowKeys.spread,
    );

    final ColorValue? color = colorResult.data;
    final DimensionValue? offsetX = offsetXResult.data;
    final DimensionValue? offsetY = offsetYResult.data;
    final DimensionValue? blur = blurResult.data;
    final DimensionValue? spread = spreadResult.data;

    final List<ParsingError> errors = <ParsingError>[
      ...colorResult.errors,
      ...offsetXResult.errors,
      ...offsetYResult.errors,
      ...blurResult.errors,
      ...spreadResult.errors,
    ];

    if (color == null || offsetX == null || offsetY == null || blur == null || spread == null) {
      return Result<ShadowValue>(
        errors: errors,
      );
    }

    return Result<ShadowValue>(
      data: ShadowValue(
        color: color,
        offsetX: offsetX,
        offsetY: offsetY,
        blur: blur,
        spread: spread,
      ),
      errors: errors,
    );
  }
}
