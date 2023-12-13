import 'package:yggdrasil/src/utils/_utils.dart';

class YgSwitchState extends YgState {
  YgSwitchState({
    bool? toggled = false,
    bool disabled = false,
    bool hovered = false,
    bool focused = false,
  })  : toggled = YgStateValue<bool?>(toggled),
        disabled = YgStateValue<bool>(disabled),
        hovered = YgStateValue<bool>(hovered),
        focused = YgStateValue<bool>(focused);

  final YgStateValue<bool?> toggled;
  final YgStateValue<bool> disabled;
  final YgStateValue<bool> hovered;
  final YgStateValue<bool> focused;

  @override
  List<YgStateValue<Object?>> get props => <YgStateValue<Object?>>[
        toggled,
        disabled,
        hovered,
        focused,
      ];
}
