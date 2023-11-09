import 'package:yggdrasil/src/components/fields/_fields.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

class YgFieldState extends YgState {
  YgFieldState({
    bool focused = false,
    bool hovered = false,
    bool disabled = false,
    bool error = false,
    bool filled = false,
    bool placeholder = false,
    bool suffix = false,
    YgFieldVariant variant = YgFieldVariant.standard,
    YgFieldSize size = YgFieldSize.large,
  })  : focused = YgStateValue<bool>(focused),
        hovered = YgStateValue<bool>(hovered),
        disabled = YgStateValue<bool>(disabled),
        error = YgStateValue<bool>(error),
        filled = YgStateValue<bool>(filled),
        placeholder = YgStateValue<bool>(placeholder),
        suffix = YgStateValue<bool>(suffix),
        variant = YgStateValue<YgFieldVariant>(variant),
        size = YgStateValue<YgFieldSize>(size);

  final YgStateValue<bool> focused;
  final YgStateValue<bool> hovered;
  final YgStateValue<bool> disabled;
  final YgStateValue<bool> error;
  final YgStateValue<bool> filled;

  final YgStateValue<bool> placeholder;
  final YgStateValue<bool> suffix;

  final YgStateValue<YgFieldVariant> variant;
  final YgStateValue<YgFieldSize> size;

  bool get showFocusHighlight => focused.value;

  @override
  List<YgStateValue<Object>> get props => <YgStateValue<Object>>[
        focused,
        hovered,
        disabled,
        error,
        filled,
        placeholder,
        suffix,
        variant,
        size,
      ];
}
