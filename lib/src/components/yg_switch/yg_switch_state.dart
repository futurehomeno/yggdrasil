import 'package:yggdrasil/src/utils/_utils.dart';

class YgSwitchState extends YgState {
  YgSwitchState({
    bool? selected = false,
    bool disabled = false,
    bool hovered = false,
    bool focused = false,
  })  : selected = YgStateValue<bool?>(selected),
        disabled = YgStateValue<bool>(disabled),
        hovered = YgStateValue<bool>(hovered),
        focused = YgStateValue<bool>(focused);

  final YgStateValue<bool?> selected;
  final YgStateValue<bool> disabled;
  final YgStateValue<bool> hovered;
  final YgStateValue<bool> focused;

  @override
  List<YgStateValue<Object?>> get props => <YgStateValue<Object?>>[
        selected,
        disabled,
        hovered,
        focused,
      ];
}
