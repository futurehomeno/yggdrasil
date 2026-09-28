import 'package:yggdrasil_token_parser/src/_token_parser.dart';

sealed class StrokeStyleValue extends TokenValue {
  const StrokeStyleValue({
    super.reference,
  });

  final TokenValueType type = TokenValueType.strokeStyle;
}

class SimpleStrokeStyleValue extends StrokeStyleValue {
  const SimpleStrokeStyleValue({
    super.reference,
    required this.style,
  });

  final TokenStrokeStyle style;

  @override
  SimpleStrokeStyleValue getReference(List<String> reference) {
    return SimpleStrokeStyleValue(
      style: style,
      reference: reference,
    );
  }
}

class CustomStrokeStyleValue extends StrokeStyleValue {
  const CustomStrokeStyleValue({
    super.reference,
    required this.dashArray,
    required this.lineCap,
  });

  final List<DimensionValue> dashArray;
  final TokenLineCap lineCap;

  @override
  CustomStrokeStyleValue getReference(List<String> reference) {
    return CustomStrokeStyleValue(
      dashArray: dashArray,
      lineCap: lineCap,
      reference: reference,
    );
  }
}
