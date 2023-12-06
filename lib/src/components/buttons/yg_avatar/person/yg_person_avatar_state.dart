import 'package:yggdrasil/src/components/buttons/yg_avatar/yg_avatar_state.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

import '../enums/_enums.dart';

class YgPersonAvatarState extends YgAvatarState {
  YgPersonAvatarState({
    super.disabled,
    super.focused,
    super.hovered,
    super.pressed,
    YgAvatarRole? role,
  }) : role = YgStateValue<YgAvatarRole?>(role);

  final YgStateValue<YgAvatarRole?> role;

  @override
  List<YgStateValue<Object?>> get props => <YgStateValue<Object?>>[
        ...super.props,
        role,
      ];
}
