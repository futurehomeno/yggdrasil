import 'package:yggdrasil/src/utils/_utils.dart';

import '_yg_slider.dart';
import 'enums/yg_slider_difference.dart';

class YgSliderState extends YgState {
  YgSliderState({
    bool disabled = false,
    bool pressed = false,
    bool hovered = false,
    bool focused = false,
    YgSliderDifference difference = YgSliderDifference.none,
    YgSliderVariant variant = YgSliderVariant.temperature,
  })  : disabled = YgStateValue<bool>(disabled),
        pressed = YgStateValue<bool>(pressed),
        hovered = YgStateValue<bool>(hovered),
        focused = YgStateValue<bool>(focused),
        difference = YgStateValue<YgSliderDifference>(difference),
        variant = YgStateValue<YgSliderVariant>(variant);

  final YgStateValue<bool> disabled;
  final YgStateValue<bool> pressed;
  final YgStateValue<bool> hovered;
  final YgStateValue<bool> focused;
  final YgStateValue<YgSliderDifference> difference;
  final YgStateValue<YgSliderVariant> variant;

  @override
  List<YgStateValue<Object?>> get props => <YgStateValue<Object?>>[
        disabled,
        pressed,
        hovered,
        focused,
        difference,
        variant,
      ];
}
