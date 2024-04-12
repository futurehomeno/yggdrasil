import 'package:yggdrasil_token_parser/theme_builder/src/models/values/_value.dart';

class TokenTypographyValue extends TokenValue {
  const TokenTypographyValue({
    super.reference,
    required this.fontFamily,
    required this.fontSize,
    required this.fontWeight,
    required this.letterSpacing,
    required this.lineHeight,
  });

  final TokenFontFamilyValue fontFamily;
  final TokenDimensionValue fontSize;
  final TokenFontWeightValue fontWeight;
  final TokenDimensionValue letterSpacing;
  final TokenNumberValue lineHeight;
}
