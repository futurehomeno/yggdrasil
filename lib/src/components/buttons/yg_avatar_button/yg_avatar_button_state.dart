import 'package:yggdrasil/src/components/buttons/widgets/_widgets.dart';
import 'package:yggdrasil/src/utils/_utils.dart';
import 'package:yggdrasil/yggdrasil.dart';

import 'enums/_enums.dart';

class YgAvatarButtonState extends YgButtonBaseState {
  YgAvatarButtonState({
    super.disabled,
    super.focused,
    super.hovered,
    super.pressed,
    YgAvatarSize size = YgAvatarSize.medium,
    YgAvatarButtonVariant variant = YgAvatarButtonVariant.person,
    bool image = false,
  })  : size = YgStateValue<YgAvatarSize>(size),
        variant = YgStateValue<YgAvatarButtonVariant>(variant),
        image = YgStateValue<bool>(image);

  final YgStateValue<YgAvatarSize> size;
  final YgStateValue<YgAvatarButtonVariant> variant;
  final YgStateValue<bool> image;

  @override
  List<YgStateValue<Object?>> get props => <YgStateValue<Object?>>[
        ...super.props,
        size,
        variant,
        image,
      ];
}
