import 'package:yggdrasil_token_parser/theme_builder/src/models/unresolved/_unresolved.dart';

import '_resolved.dart';

abstract class Token extends TokenObject {
  const Token({
    required this.description,
    required this.unresolved,
  });

  final String? description;
  final UnresolvedToken unresolved;
}
