import 'package:yggdrasil_token_parser/src/_token_parser.dart';

class TypographyValue extends TokenValue {
  const TypographyValue({
    super.reference,
    required this.fontFamily,
    required this.fontSize,
    required this.fontWeight,
    required this.letterSpacing,
    required this.lineHeight,
  });

  final FontFamilyValue fontFamily;
  final DimensionValue fontSize;
  final FontWeightValue fontWeight;
  final DimensionValue letterSpacing;
  final NumberValue lineHeight;
  final TokenValueType type = TokenValueType.typography;

  @override
  TypographyValue getReference(List<String> reference) {
    return TypographyValue(
      fontFamily: fontFamily,
      fontSize: fontSize,
      fontWeight: fontWeight,
      letterSpacing: letterSpacing,
      lineHeight: lineHeight,
      reference: reference,
    );
  }
}
