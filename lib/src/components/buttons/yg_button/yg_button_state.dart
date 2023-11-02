import 'package:yggdrasil/src/components/buttons/widgets/yg_button_base_state.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

import '_yg_button.dart';

class YgButtonState extends YgButtonBaseState {
  YgButtonState({
    super.focused,
    super.disabled,
    super.hovered,
    super.pressed,
    YgButtonVariant variant = YgButtonVariant.primary,
    YgButtonSize size = YgButtonSize.large,
  })  : variant = YgStateValue<YgButtonVariant>(variant),
        size = YgStateValue<YgButtonSize>(size);

  final YgStateValue<YgButtonVariant> variant;
  final YgStateValue<YgButtonSize> size;

  @override
  List<YgStateValue<Object>> get props => <YgStateValue<Object>>[
        ...super.props,
        variant,
        size,
      ];
}
