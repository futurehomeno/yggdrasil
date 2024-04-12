import 'package:yggdrasil_token_parser/theme_builder/src/resolver.dart';

import '../models/_models.dart';

abstract final class BorderParser {
  const BorderParser._();

  static Result<TokenBorderValue> parse(Resolver resolver, UnresolvedCompositeToken token) {
    final UnresolvedValueOrReference? unresolvedColor = token.properties['color']
  }
}
