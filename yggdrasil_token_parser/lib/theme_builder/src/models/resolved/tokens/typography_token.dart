import 'package:yggdrasil_token_parser/theme_builder/src/models/primary_tokens/_values.dart';

import '../_resolved.dart';

class TypographyToken extends Token {
  const TypographyToken({
    required super.unresolved,
    required this.families,
    required this.fontSize,
    required this.fontWeight,
    required this.letterSpacing,
    required this.lineHeight,
    super.description,
  });

  final List<String> families;
  final TokenDimension fontSize;
  final TokenFontWeight fontWeight;
  final TokenDimension letterSpacing;
  final double lineHeight;
}
