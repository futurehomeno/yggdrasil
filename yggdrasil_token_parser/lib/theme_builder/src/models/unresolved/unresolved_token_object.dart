import 'package:yggdrasil_token_parser/theme_builder/src/enums/_enums.dart';

import '_unresolved.dart';

part 'tokens/unresolved_composite_token.dart';
part 'tokens/unresolved_reference_token.dart';
part 'tokens/unresolved_token.dart';
part 'tokens/unresolved_value_token.dart';
part 'unresolved_token_group.dart';

sealed class UnresolvedTokenObject {
  const UnresolvedTokenObject({
    required this.parent,
  });

  final UnresolvedTokenGroup? parent;
}
