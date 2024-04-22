import 'package:yggdrasil_token_parser/theme_builder/src/composited_value_parsers/token_stroke_style_parser.dart';
import 'package:yggdrasil_token_parser/theme_builder/src/extensions/_extensions.dart';
import 'package:yggdrasil_token_parser/theme_builder/src/resolver.dart';
import 'package:yggdrasil_token_parser/theme_builder/src/value_parsers/_value_parsers.dart';

import '../models/_models.dart';

abstract final class BorderParser {
  const BorderParser._();

  static const String _colorKey = 'color';
  static const String _widthKey = 'width';
  static const String _styleKey = 'style';

  static Result<TokenBorderValue> parse(ResolvingContext context, UnresolvedCompositeToken token) {
    final UnresolvedValueOrReference? unresolvedColor = token.properties[_colorKey];
    final UnresolvedValueOrReference? unresolvedWidth = token.properties[_widthKey];
    final UnresolvedValueOrReference? unresolvedStyle = token.properties[_styleKey];
    final List<ParsingError> errors = <ParsingError>[];

    TokenColorValue? color = null;
    TokenDimensionValue? width = null;
    TokenStrokeStyleValue? style = null;

    if (unresolvedColor == null) {
      errors.add(
        TokenParseMissingError(
          path: <String>[_colorKey],
        ),
      );
    } else {
      final Result<TokenColorValue> result = context.parseValueOrReference(unresolvedColor, ColorParser.parse);
      errors.addAllWithPath(<String>['color'], result.errors);
      color = result.data;
    }

    if (unresolvedWidth == null) {
      errors.add(
        TokenParseMissingError(
          path: <String>[_widthKey],
        ),
      );
    } else {
      final Result<TokenDimensionValue> result = context.parseValueOrReference(unresolvedWidth, DimensionParser.parse);
      errors.addAllWithPath(<String>['width'], result.errors);
      width = result.data;
    }

    if (unresolvedStyle == null) {
      errors.add(
        TokenParseMissingError(
          path: <String>[_styleKey],
        ),
      );
    } else {
      final Result<TokenValue> result = context.parseValueOrReference(unresolvedStyle, StrokeStyleParser.parse);
      errors.addAllWithPath(<String>['style'], result.errors);
      style = result.data;
    }
  }
}
