import 'package:yggdrasil/src/utils/_utils.dart';

class YgCheckboxState extends YgState {
  YgCheckboxState({
    bool focused = false,
    bool hovered = false,
    bool? checked = false,
    bool error = false,
    bool disabled = false,
  })  : focused = YgStateValue<bool>(focused),
        hovered = YgStateValue<bool>(hovered),
        checked = YgStateValue<bool?>(checked),
        error = YgStateValue<bool>(error),
        disabled = YgStateValue<bool>(disabled);

  final YgStateValue<bool> focused;
  final YgStateValue<bool> hovered;
  final YgStateValue<bool?> checked;
  final YgStateValue<bool> error;
  final YgStateValue<bool> disabled;

  @override
  List<YgStateValue<Object?>> get props => <YgStateValue<Object?>>[
        focused,
        hovered,
        checked,
        error,
        disabled,
      ];
}
