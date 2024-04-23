import 'package:yggdrasil_token_parser/theme_builder/src/enums/token_value_type.dart';
import 'package:yggdrasil_token_parser/theme_builder/src/models/_models.dart';

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
  final TokenValueType type = TokenValueType.typography;

  @override
  TokenTypographyValue getReference(List<String> reference) {
    return TokenTypographyValue(
      fontFamily: fontFamily,
      fontSize: fontSize,
      fontWeight: fontWeight,
      letterSpacing: letterSpacing,
      lineHeight: lineHeight,
      reference: reference,
    );
  }
}
