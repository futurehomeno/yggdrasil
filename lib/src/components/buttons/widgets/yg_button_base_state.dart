import 'package:yggdrasil/yggdrasil.dart';

class YgButtonBaseState extends YgState {
  YgButtonBaseState({
    bool focused = false,
    bool hovered = false,
    bool disabled = false,
    bool pressed = false,
  })  : focused = YgStateValue<bool>(initialValue: focused),
        hovered = YgStateValue<bool>(initialValue: hovered),
        disabled = YgStateValue<bool>(initialValue: disabled),
        pressed = YgStateValue<bool>(initialValue: pressed);

  final YgStateValue<bool> focused;
  final YgStateValue<bool> hovered;
  final YgStateValue<bool> disabled;
  final YgStateValue<bool> pressed;

  @override
  List<YgStateValue<Object>> get props => <YgStateValue<Object>>[
        focused,
        hovered,
        disabled,
        pressed,
      ];
}
