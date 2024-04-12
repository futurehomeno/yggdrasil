import 'package:yggdrasil_token_parser/theme_builder/src/models/composited_tokens/stroke_style_token.dart';
import 'package:yggdrasil_token_parser/theme_builder/src/models/primary_tokens/_values.dart';
import 'package:yggdrasil_token_parser/theme_builder/src/models/values/_value.dart';

import '../_resolved.dart';

class BorderToken extends Token {
  const BorderToken({
    required this.color,
    required this.dimension,
    required this.style,
    super.description,
  });

  final int color;
  final TokenDimensionValue dimension;
  final TokenStrokeStyle style;
}
