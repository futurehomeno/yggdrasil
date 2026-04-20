import 'package:yggdrasil_token_parser/src/_token_parser.dart';
import 'package:yggdrasil_utils/yggdrasil_utils.dart';

abstract final class TypographyParser {
  const TypographyParser._();

  static Result<TypographyValue> parse(ParsingContext context, Object value) {
    if (value is! JsonObject) {
      return Result<TypographyValue>.error(
        ParsingError.dataType(
          expected: JsonObject,
          actual: value.runtimeType,
          path: <String>[],
        ),
      );
    }

    final Result<FontFamilyValue> fontFamilyResult = context.parseOrResolveProperty(
      parser: FontFamilyParser.parse,
      object: value,
      key: TypographyKeys.fontFamily,
    );
    final Result<DimensionValue> fontSizeResult = context.parseOrResolveProperty(
      parser: DimensionParser.parse,
      object: value,
      key: TypographyKeys.fontSize,
    );
    final Result<FontWeightValue> fontWeightResult = context.parseOrResolveProperty(
      parser: FontWeightParser.parse,
      object: value,
      key: TypographyKeys.fontWeight,
    );
    final Result<DimensionValue> letterSpacingResult = context.parseOrResolveProperty(
      parser: DimensionParser.parse,
      object: value,
      key: TypographyKeys.letterSpacing,
    );
    final Result<NumberValue> lineHeightResult = context.parseOrResolveProperty(
      parser: NumberParser.parse,
      object: value,
      key: TypographyKeys.lineHeight,
    );

    final FontFamilyValue? fontFamily = fontFamilyResult.data;
    final DimensionValue? fontSize = fontSizeResult.data;
    final FontWeightValue? fontWeight = fontWeightResult.data;
    final DimensionValue? letterSpacing = letterSpacingResult.data;
    final NumberValue? lineHeight = lineHeightResult.data;

    final List<ParsingError> errors = <ParsingError>[
      ...fontFamilyResult.errors,
      ...fontSizeResult.errors,
      ...fontWeightResult.errors,
      ...letterSpacingResult.errors,
      ...lineHeightResult.errors,
    ];

    if (fontFamily == null || fontSize == null || fontWeight == null || letterSpacing == null || lineHeight == null) {
      return Result<TypographyValue>(
        errors: errors,
      );
    }

    return Result<TypographyValue>(
      data: TypographyValue(
        fontFamily: fontFamily,
        fontSize: fontSize,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
        lineHeight: lineHeight,
      ),
      errors: errors,
    );
  }
}
