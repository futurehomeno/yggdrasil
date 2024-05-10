import 'package:yggdrasil/src/components/buttons/widgets/_widgets.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

import 'enums/_enums.dart';

class YgStepperButtonState extends YgButtonBaseState {
  YgStepperButtonState({
    super.disabled,
    super.focused,
    super.hovered,
    super.pressed,
    YgStepperButtonSize size = YgStepperButtonSize.large,
  }) : size = YgStateValue<YgStepperButtonSize>(size);

  final YgStateValue<YgStepperButtonSize> size;

  @override
  List<YgStateValue<Object?>> get props => <YgStateValue<Object?>>[
        ...super.props,
        size,
      ];
}
