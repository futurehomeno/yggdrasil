import 'package:yggdrasil/src/components/buttons/widgets/yg_button_base_state.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

class YgSegmentedButtonSegmentState extends YgButtonBaseState {
  YgSegmentedButtonSegmentState({
    super.disabled,
    super.focused,
    super.hovered,
    super.pressed,
    bool selected = false,
  }) : selected = YgStateValue<bool>(selected);

  final YgStateValue<bool> selected;

  @override
  List<YgStateValue<Object?>> get props => <YgStateValue<Object?>>[
        ...super.props,
        selected,
      ];
}
