import 'package:yggdrasil/src/components/yg_stepper/enums/_enums.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

class YgStepperState extends YgState {
  YgStepperState({
    bool disabled = false,
    YgStepperSize size = YgStepperSize.large,
  }) : disabled = YgStateValue<bool>(disabled),
       size = YgStateValue<YgStepperSize>(size);

  final YgStateValue<bool> disabled;

  final YgStateValue<YgStepperSize> size;

  @override
  List<YgStateValue<Object?>> get props => <YgStateValue<Object?>>[
    disabled,
    size,
  ];
}
