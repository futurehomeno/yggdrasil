import 'package:yggdrasil_token_parser/theme_builder/src/enums/_enums.dart';

import '_unresolved.dart';

abstract class UnresolvedToken extends UnresolvedTokenObject {
  const UnresolvedToken({
    required this.description,
    required this.type,
  });

  final String? description;
  final TokenValueType type;
}
