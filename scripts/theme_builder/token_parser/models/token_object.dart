part 'theme_variant.dart';
part 'token_group.dart';
part 'token_reference.dart';
part 'token_value.dart';

sealed class TokenObject {
  const TokenObject();

  bool isStructurallyIdentical(TokenObject other);
}
