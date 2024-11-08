import 'package:yggdrasil/src/utils/yg_states/yg_state.dart';
import 'package:yggdrasil/src/utils/yg_states/yg_state_value.dart';

class YgSearchBarState extends YgState {
  YgSearchBarState({
    bool pressed = false,
    bool hovered = false,
  })  : pressed = YgStateValue<bool>(pressed),
        hovered = YgStateValue<bool>(hovered);

  final YgStateValue<bool> pressed;
  final YgStateValue<bool> hovered;

  @override
  List<YgStateValue<Object?>> get props => <YgStateValue<Object?>>[
        pressed,
        hovered,
      ];
}
