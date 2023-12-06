import 'package:yggdrasil/src/components/buttons/widgets/yg_button_base_style.dart';
import 'package:yggdrasil/src/components/buttons/yg_avatar/enums/_enums.dart';
import 'package:yggdrasil/src/components/buttons/yg_avatar/person/yg_person_avatar_style.dart';
import 'package:yggdrasil/src/components/buttons/yg_avatar/yg_avatar.dart';
import 'package:yggdrasil/src/components/buttons/yg_avatar/yg_avatar_state.dart';
import 'package:yggdrasil/src/utils/yg_states/interfaces/yg_vsync.dart';

import 'yg_person_avatar_state.dart';

class YgPersonAvatar extends YgAvatar {
  const YgPersonAvatar({
    required super.name,
    super.autofocus,
    super.focusNode,
    super.key,
    super.onFocusChange,
    super.onHover,
    super.onLongPress,
    super.onPressed,
    super.size,
    this.role,
  });

  final YgAvatarRole? role;

  @override
  YgAvatarState createButtonState() {
    return YgPersonAvatarState(
      role: role,
    );
  }

  @override
  YgButtonBaseStyle<YgAvatarState> createStyle(YgVsync vsync, YgAvatarState state) {
    return YgPersonAvatarStyle(
      state: state,
      vsync: vsync,
    );
  }

  @override
  void updateState(covariant YgPersonAvatarState state) {
    state.role.value = role;
  }
}
