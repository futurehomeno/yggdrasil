import 'package:yggdrasil/src/utils/_utils.dart';

class YgRadioState extends YgState {
  YgRadioState({
    bool hovered = false,
    bool focused = false,
    bool error = false,
    bool disabled = false,
    bool selected = false,
  }) : hovered = YgStateValue<bool>(hovered),
       focused = YgStateValue<bool>(focused),
       error = YgStateValue<bool>(error),
       disabled = YgStateValue<bool>(disabled),
       selected = YgStateValue<bool>(selected);

  final YgStateValue<bool> hovered;
  final YgStateValue<bool> focused;
  final YgStateValue<bool> error;
  final YgStateValue<bool> disabled;
  final YgStateValue<bool> selected;

  @override
  List<YgStateValue<Object>> get props => <YgStateValue<Object>>[
    hovered,
    focused,
    error,
    disabled,
    selected,
  ];
}
