import 'package:yggdrasil_token_parser/src/_token_parser.dart';
import 'package:yggdrasil_utils/yggdrasil_utils.dart';

import 'composition_keys.dart';

abstract final class CompositionParser {
  const CompositionParser._();

  static Result<CompositionValue> parse(ParsingContext context, Object value) {
    if (value is! JsonObject) {
      return Result<CompositionValue>.error(
        ParsingError.dataType(
          expected: JsonObject,
          actual: value.runtimeType,
          path: <String>[],
        ),
      );
    }

    final Result<BorderRadiusValue> borderRadiusResult = context.parseOrResolveProperty(
      parser: BorderRadiusParser.parse,
      object: value,
      key: CompositionKeys.borderRadius,
    );
    final Result<BorderValue> borderResult = context.parseOrResolveProperty(
      parser: BorderParser.parse,
      object: value,
      key: CompositionKeys.border,
    );
    final Result<ColorValue> fillResult = context.parseOrResolveProperty(
      parser: ColorParser.parse,
      object: value,
      key: CompositionKeys.fill,
    );
    final Result<ShadowValue> shadowResult = context.parseOrResolveProperty(
      parser: ShadowParser.parse,
      object: value,
      key: CompositionKeys.shadow,
    );
    final Result<GradientValue> gradientResult = context.parseOrResolveProperty(
      parser: GradientParser.parse,
      object: value,
      key: CompositionKeys.gradient,
    );
    final Result<OpacityValue> opacityValueResult = context.parseOrResolveProperty(
      parser: OpacityParser.parse,
      object: value,
      key: CompositionKeys.opacity,
    );

    final List<ParsingError> errors = <ParsingError>[
      ...borderRadiusResult.errors,
      ...borderResult.errors,
      ...fillResult.errors,
      ...shadowResult.errors,
      ...gradientResult.errors,
      ...opacityValueResult.errors,
    ];

    return Result<CompositionValue>(
      data: CompositionValue(
        borderRadius: borderRadiusResult.data,
        border: borderResult.data,
        fill: fillResult.data,
        shadow: shadowResult.data,
        gradient: gradientResult.data,
        opacity: opacityValueResult.data,
      ),
      errors: errors,
    );
  }
}
