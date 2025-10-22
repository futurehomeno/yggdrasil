import 'package:yggdrasil/src/utils/_utils.dart';

class YgStepperState extends YgState {
  YgStepperState({
    bool disabled = false,
  }) : disabled = YgStateValue<bool>(disabled);

  final YgStateValue<bool> disabled;

  @override
  List<YgStateValue<Object?>> get props => <YgStateValue<Object?>>[
    disabled,
  ];
}
