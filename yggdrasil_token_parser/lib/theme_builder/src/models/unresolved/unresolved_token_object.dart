import 'package:yggdrasil_token_parser/theme_builder/src/enums/_enums.dart';

import '_unresolved.dart';

part 'unresolved_token.dart';
part 'unresolved_token_group.dart';

sealed class UnresolvedTokenObject {
  const UnresolvedTokenObject({
    required this.parent,
  });

  final UnresolvedTokenGroup? parent;
}
