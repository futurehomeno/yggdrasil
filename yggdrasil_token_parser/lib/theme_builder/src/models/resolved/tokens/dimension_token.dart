import 'package:yggdrasil_token_parser/theme_builder/src/models/primary_tokens/_values.dart';

import '../_resolved.dart';

class DimensionToken extends Token {
  const DimensionToken({
    required super.unresolved,
    required this.dimension,
    super.description,
  });

  final TokenDimension dimension;
}
