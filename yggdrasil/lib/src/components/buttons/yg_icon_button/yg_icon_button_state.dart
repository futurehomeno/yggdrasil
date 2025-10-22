import 'package:yggdrasil/src/components/buttons/widgets/yg_button_base_state.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

import '_yg_icon_button.dart';

class YgIconButtonState extends YgButtonBaseState {
  YgIconButtonState({
    super.focused,
    super.disabled,
    super.hovered,
    super.pressed,
    YgIconButtonVariant variant = YgIconButtonVariant.standard,
    YgIconButtonSize size = YgIconButtonSize.medium,
  }) : variant = YgStateValue<YgIconButtonVariant>(variant),
       size = YgStateValue<YgIconButtonSize>(size);

  final YgStateValue<YgIconButtonVariant> variant;
  final YgStateValue<YgIconButtonSize> size;

  @override
  List<YgStateValue<Object?>> get props => <YgStateValue<Object?>>[
    ...super.props,
    variant,
    size,
  ];
}
