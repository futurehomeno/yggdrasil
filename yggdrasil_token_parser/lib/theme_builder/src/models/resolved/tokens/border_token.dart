import 'package:yggdrasil_token_parser/theme_builder/src/models/composited_tokens/stroke_style_token.dart';
import 'package:yggdrasil_token_parser/theme_builder/src/models/primary_tokens/_values.dart';

import '../_resolved.dart';

class BorderToken extends Token {
  const BorderToken({
    required super.unresolved,
    required this.color,
    required this.dimension,
    required this.style,
    super.description,
  });

  final int color;
  final TokenDimension dimension;
  final TokenStrokeStyle style;
}
