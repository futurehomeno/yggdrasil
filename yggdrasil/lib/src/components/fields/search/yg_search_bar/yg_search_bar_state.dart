import 'package:yggdrasil/src/utils/yg_states/_yg_states.dart';

/// Internal visual state of the search bar.
class YgSearchBarState extends YgState {
  YgSearchBarState({
    bool pressed = false,
    bool hovered = false,
    bool focused = false,
  })  : pressed = YgStateValue<bool>(pressed),
        hovered = YgStateValue<bool>(hovered),
        focused = YgStateValue<bool>(focused);

  final YgStateValue<bool> pressed;
  final YgStateValue<bool> hovered;
  final YgStateValue<bool> focused;

  @override
  List<YgStateValue<Object?>> get props => <YgStateValue<Object?>>[
        pressed,
        hovered,
        focused,
      ];
}