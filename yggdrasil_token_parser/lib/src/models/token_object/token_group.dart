import 'package:yggdrasil_token_parser/src/models/enums/_enums.dart';

import '_token_object.dart';

class TokenGroup extends TokenObject {
  const TokenGroup({
    required this.children,
    this.type,
    this.description,
  });

  final Map<String, TokenObject> children;
  final TokenValueType? type;
  final String? description;
}
