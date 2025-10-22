import 'package:yggdrasil/src/components/buttons/widgets/_widgets.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

import '_yg_toggle_button.dart';

class YgToggleButtonState extends YgButtonBaseState {
  YgToggleButtonState({
    super.focused,
    super.disabled,
    super.hovered,
    super.pressed,
    YgToggleButtonVariant variant = YgToggleButtonVariant.text,
    YgToggleButtonSize size = YgToggleButtonSize.large,
    bool toggled = false,
  }) : variant = YgStateValue<YgToggleButtonVariant>(variant),
       size = YgStateValue<YgToggleButtonSize>(size),
       toggled = YgStateValue<bool>(toggled);

  final YgStateValue<YgToggleButtonVariant> variant;
  final YgStateValue<YgToggleButtonSize> size;
  final YgStateValue<bool> toggled;

  @override
  List<YgStateValue<Object?>> get props => <YgStateValue<Object?>>[
    ...super.props,
    variant,
    size,
    toggled,
  ];
}
