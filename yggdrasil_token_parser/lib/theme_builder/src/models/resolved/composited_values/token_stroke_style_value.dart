import 'package:yggdrasil_token_parser/theme_builder/src/enums/_enums.dart';
import 'package:yggdrasil_token_parser/theme_builder/src/models/_models.dart';

class TokenStrokeStyleValue extends TokenValue {
  const TokenStrokeStyleValue({
    super.reference,
  });
}

class TokenSimpleStrokeStyleValue extends TokenStrokeStyleValue {
  const TokenSimpleStrokeStyleValue({
    super.reference,
    required this.style,
  });

  final TokenStrokeStyle style;
}

class TokenCustomStrokeStyleValue extends TokenStrokeStyleValue {
  const TokenCustomStrokeStyleValue({
    super.reference,
    required this.dashArray,
    required this.lineCap,
  });

  final List<TokenDimensionValue> dashArray;
  final TokenLineCap lineCap;
}
