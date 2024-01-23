import 'package:yggdrasil_token_parser/theme_builder/src/enums/_enums.dart';

import '_unresolved.dart';

class UnresolvedTokenGroup extends UnresolvedTokenObject {
  const UnresolvedTokenGroup({
    required this.children,
    this.type,
    this.description,
  });

  final Map<String, UnresolvedTokenObject> children;
  final TokenValueType? type;
  final String? description;
}
