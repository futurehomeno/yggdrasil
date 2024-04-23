import 'package:yggdrasil_token_parser/theme_builder/src/enums/_enums.dart';
import 'package:yggdrasil_token_parser/theme_builder/src/models/_models.dart';
import 'package:yggdrasil_token_parser/theme_builder/src/parser/errors/parsing_error.dart';
import 'package:yggdrasil_token_parser/theme_builder/src/parser/parsing_context.dart';

abstract final class FontWeightParser {
  const FontWeightParser._();

  static final Map<int, TokenFontWeight> _numberMap = <int, TokenFontWeight>{
    100: TokenFontWeight.w100,
    200: TokenFontWeight.w200,
    300: TokenFontWeight.w300,
    400: TokenFontWeight.w400,
    500: TokenFontWeight.w500,
    600: TokenFontWeight.w600,
    700: TokenFontWeight.w700,
    800: TokenFontWeight.w800,
    900: TokenFontWeight.w900,
    950: TokenFontWeight.w900, // Flutter does not support TokenFontWeight.w950.
  };

  static final Map<String, TokenFontWeight> _nameMap = <String, TokenFontWeight>{
    'thin': TokenFontWeight.w100,
    'hairline': TokenFontWeight.w100,
    'extra-light': TokenFontWeight.w200,
    'ultra-light': TokenFontWeight.w200,
    'light': TokenFontWeight.w300,
    'normal': TokenFontWeight.w400,
    'regular': TokenFontWeight.w400,
    'book': TokenFontWeight.w400,
    'medium': TokenFontWeight.w500,
    'semi-bold': TokenFontWeight.w600,
    'demi-bold': TokenFontWeight.w600,
    'bold': TokenFontWeight.w700,
    'extra-bold': TokenFontWeight.w800,
    'ultra-bold': TokenFontWeight.w800,
    'black': TokenFontWeight.w900,
    'heavy': TokenFontWeight.w900,
    'extra-black': TokenFontWeight.w900,
    'ultra-black': TokenFontWeight.w900,
  };

  static Result<TokenFontWeightValue> parse(ParsingContext context, Object value) {
    final TokenFontWeight? fontWeight = switch (value) {
      String() => _nameMap[value],
      num() => _numberMap[value.toInt()],
      _ => null,
    };

    if (fontWeight == null) {
      return Result<TokenFontWeightValue>.error(
        ParsingError.format(
          data: value,
          path: <String>[],
        ),
      );
    }

    return Result<TokenFontWeightValue>.data(
      TokenFontWeightValue(
        weight: fontWeight,
      ),
    );
  }
}
