import 'package:yggdrasil_token_parser/theme_builder/src/models/_models.dart';
import 'package:yggdrasil_token_parser/theme_builder/src/parser/errors/parsing_error.dart';
import 'package:yggdrasil_token_parser/theme_builder/src/parser/parsing_context.dart';
import 'package:yggdrasil_token_parser/theme_builder/src/value_parsers/_value_parsers.dart';
import 'package:yggdrasil_utils/yggdrasil_utils.dart';

abstract final class TypographyKeys {
  const TypographyKeys._();

  static const String fontFamily = 'fontFamily';
  static const String fontSize = 'fontSize';
  static const String fontWeight = 'fontWeight';
  static const String letterSpacing = 'letterSpacing';
  static const String lineHeight = 'lineHeight';
}

abstract final class TypographyParser {
  const TypographyParser._();

  static Result<TokenTypographyValue> parse(ParsingContext context, Object value) {
    if (value is! JsonObject) {
      return Result<TokenTypographyValue>.error(
        ParsingError.dataType(
          expected: JsonObject,
          actual: value.runtimeType,
          path: <String>[],
        ),
      );
    }

    final Result<TokenFontFamilyValue> fontFamilyResult = context.parseOrResolveProperty(
      parser: FontFamilyParser.parse,
      object: value,
      key: TypographyKeys.fontFamily,
    );
    final Result<TokenDimensionValue> fontSizeResult = context.parseOrResolveProperty(
      parser: DimensionParser.parse,
      object: value,
      key: TypographyKeys.fontSize,
    );
    final Result<TokenFontWeightValue> fontWeightResult = context.parseOrResolveProperty(
      parser: FontWeightParser.parse,
      object: value,
      key: TypographyKeys.fontWeight,
    );
    final Result<TokenDimensionValue> letterSpacingResult = context.parseOrResolveProperty(
      parser: DimensionParser.parse,
      object: value,
      key: TypographyKeys.letterSpacing,
    );
    final Result<TokenNumberValue> lineHeightResult = context.parseOrResolveProperty(
      parser: NumberParser.parse,
      object: value,
      key: TypographyKeys.lineHeight,
    );

    final TokenFontFamilyValue? fontFamily = fontFamilyResult.data;
    final TokenDimensionValue? fontSize = fontSizeResult.data;
    final TokenFontWeightValue? fontWeight = fontWeightResult.data;
    final TokenDimensionValue? letterSpacing = letterSpacingResult.data;
    final TokenNumberValue? lineHeight = lineHeightResult.data;

    final List<ParsingError> errors = <ParsingError>[
      ...fontFamilyResult.errors,
      ...fontSizeResult.errors,
      ...fontWeightResult.errors,
      ...letterSpacingResult.errors,
      ...lineHeightResult.errors,
    ];

    if (fontFamily == null || fontSize == null || fontWeight == null || letterSpacing == null || lineHeight == null) {
      return Result<TokenTypographyValue>(
        errors: errors,
      );
    }

    return Result<TokenTypographyValue>(
      data: TokenTypographyValue(
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
