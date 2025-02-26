import 'package:yggdrasil/src/utils/_utils.dart';

class YgTabInternalState extends YgState {
  YgTabInternalState({
    bool hovered = false,
    bool focused = false,
    bool pressed = false,
    bool selected = false,
  })  : hovered = YgStateValue<bool>(hovered),
        focused = YgStateValue<bool>(focused),
        pressed = YgStateValue<bool>(pressed),
        selected = YgStateValue<bool>(selected);

  final YgStateValue<bool> hovered;
  final YgStateValue<bool> focused;
  final YgStateValue<bool> pressed;
  final YgStateValue<bool> selected;

  @override
  List<YgStateValue<Object?>> get props => <YgStateValue<Object?>>[
        hovered,
        focused,
        pressed,
        selected,
      ];
}
