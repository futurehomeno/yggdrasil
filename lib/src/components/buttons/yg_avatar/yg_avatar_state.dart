import 'package:yggdrasil/src/components/buttons/widgets/_widgets.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

import 'enums/_enums.dart';

class YgAvatarState extends YgButtonBaseState {
  YgAvatarState({
    super.disabled,
    super.focused,
    super.hovered,
    super.pressed,
    YgAvatarSize size = YgAvatarSize.medium,
  }) : size = YgStateValue<YgAvatarSize>(size);

  final YgStateValue<YgAvatarSize> size;

  @override
  List<YgStateValue<Object?>> get props => <YgStateValue<Object?>>[
        ...super.props,
        size,
      ];
}
