import 'package:yggdrasil_token_parser/theme_builder/src/enums/_enums.dart';

import '../_resolved.dart';

class FontWeightToken extends Token {
  const FontWeightToken({
    required this.fontWeight,
    required super.description,
  });

  final TokenFontWeight fontWeight;
}
