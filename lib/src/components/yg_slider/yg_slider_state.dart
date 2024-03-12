import 'package:yggdrasil/src/utils/_utils.dart';

import '_yg_slider.dart';
import 'enums/yg_slider_difference.dart';

class YgSliderState extends YgState {
  YgSliderState({
    bool disabled = false,
    bool pressed = false,
    bool hovered = false,
    bool focused = false,
    bool showIndicators = false,
    YgSliderDifference difference = YgSliderDifference.none,
    YgSliderVariant variant = YgSliderVariant.temperature,
  })  : disabled = YgStateValue<bool>(disabled),
        editing = YgStateValue<bool>(pressed),
        hovered = YgStateValue<bool>(hovered),
        focused = YgStateValue<bool>(focused),
        showIndicators = YgStateValue<bool>(showIndicators),
        difference = YgStateValue<YgSliderDifference>(difference),
        variant = YgStateValue<YgSliderVariant>(variant);

  final YgStateValue<bool> disabled;
  final YgStateValue<bool> editing;
  final YgStateValue<bool> hovered;
  final YgStateValue<bool> focused;
  final YgStateValue<bool> showIndicators;
  final YgStateValue<YgSliderDifference> difference;
  final YgStateValue<YgSliderVariant> variant;

  @override
  List<YgStateValue<Object?>> get props => <YgStateValue<Object?>>[
        disabled,
        editing,
        hovered,
        focused,
        difference,
        showIndicators,
        variant,
      ];
}
