import 'package:yggdrasil_token_parser/theme_builder/src/enums/_enums.dart';
import 'package:yggdrasil_token_parser/theme_builder/src/models/_models.dart';

sealed class TokenStrokeStyleValue extends TokenValue {
  const TokenStrokeStyleValue({
    super.reference,
  });

  final TokenValueType type = TokenValueType.strokeStyle;
}

class TokenSimpleStrokeStyleValue extends TokenStrokeStyleValue {
  const TokenSimpleStrokeStyleValue({
    super.reference,
    required this.style,
  });

  final TokenStrokeStyle style;

  @override
  TokenSimpleStrokeStyleValue getReference(List<String> reference) {
    return TokenSimpleStrokeStyleValue(
      style: style,
      reference: reference,
    );
  }
}

class TokenCustomStrokeStyleValue extends TokenStrokeStyleValue {
  const TokenCustomStrokeStyleValue({
    super.reference,
    required this.dashArray,
    required this.lineCap,
  });

  final List<TokenDimensionValue> dashArray;
  final TokenLineCap lineCap;

  @override
  TokenCustomStrokeStyleValue getReference(List<String> reference) {
    return TokenCustomStrokeStyleValue(
      dashArray: dashArray,
      lineCap: lineCap,
      reference: reference,
    );
  }
}
