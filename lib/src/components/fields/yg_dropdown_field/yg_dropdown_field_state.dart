import 'package:yggdrasil/src/components/fields/yg_field_state.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

class YgDropdownFieldState extends YgFieldState {
  YgDropdownFieldState({
    super.focused,
    super.hovered,
    super.disabled,
    super.error,
    super.filled,
    super.placeholder,
    super.suffix,
    super.variant,
    super.size,
    bool opened = false,
  }) : opened = YgStateValue<bool>(opened);

  final YgStateValue<bool> opened;

  @override
  bool get showFocusHighlight => focused.value || opened.value;

  @override
  List<YgStateValue<Object>> get props => <YgStateValue<Object>>[
        ...super.props,
        opened,
      ];
}
