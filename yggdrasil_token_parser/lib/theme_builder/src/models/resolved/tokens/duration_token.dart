import 'package:yggdrasil_token_parser/theme_builder/src/_token_parser.dart';

import '../_resolved.dart';

class DurationToken extends Token {
  const DurationToken({
    required super.unresolved,
    required this.dimension,
    super.description,
  });

  final TokenDimension dimension;
}
