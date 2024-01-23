import 'package:yggdrasil_token_parser/theme_builder/src/_token_parser.dart';

import '../_resolved.dart';

abstract class StrokeStyleToken extends Token {
  const StrokeStyleToken({
    required super.unresolved,
    required super.description,
  });
}

class BasicStrokeStyleToken extends StrokeStyleToken {
  const BasicStrokeStyleToken({
    required super.unresolved,
    required this.strokeStyle,
    super.description,
  });

  final TokenStrokeStyle strokeStyle;
}

class AdvancedStrokeStyleToken extends StrokeStyleToken {
  const AdvancedStrokeStyleToken({
    required super.unresolved,
    required this.dashArray,
    required this.lineCap,
    super.description,
  });

  final List<TokenDimension> dashArray;
  final TokenLineCap lineCap;
}
