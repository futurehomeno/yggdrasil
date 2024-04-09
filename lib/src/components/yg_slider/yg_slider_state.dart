import 'package:yggdrasil/src/utils/_utils.dart';

import '_yg_slider.dart';

class YgSliderState extends YgState {
  YgSliderState({
    bool disabled = false,
    bool editing = false,
    bool recentlyEdited = false,
    bool hovered = false,
    bool focused = false,
    bool valueIndicatorEnabled = false,
    bool differenceIndicatorEnabled = false,
    bool staticDifferenceIndicatorIndicator = false,
    bool increasing = false,
    YgSliderVariant variant = YgSliderVariant.temperature,
  })  : disabled = YgStateValue<bool>(disabled),
        editing = YgStateValue<bool>(editing),
        recentlyEdited = YgStateValue<bool>(recentlyEdited),
        hovered = YgStateValue<bool>(hovered),
        focused = YgStateValue<bool>(focused),
        valueIndicatorEnabled = YgStateValue<bool>(valueIndicatorEnabled),
        differenceIndicatorEnabled = YgStateValue<bool>(differenceIndicatorEnabled),
        staticDifferenceIndicatorEnabled = YgStateValue<bool>(staticDifferenceIndicatorIndicator),
        increasing = YgStateValue<bool>(increasing),
        variant = YgStateValue<YgSliderVariant>(variant);

  final YgStateValue<YgSliderVariant> variant;

  // States
  final YgStateValue<bool> disabled;
  final YgStateValue<bool> editing;
  final YgStateValue<bool> recentlyEdited;
  final YgStateValue<bool> hovered;
  final YgStateValue<bool> focused;
  final YgStateValue<bool> increasing;

  // Indicators
  final YgStateValue<bool> valueIndicatorEnabled;
  final YgStateValue<bool> differenceIndicatorEnabled;
  final YgStateValue<bool> staticDifferenceIndicatorEnabled;

  @override
  List<YgStateValue<Object?>> get props => <YgStateValue<Object?>>[
        variant,
        disabled,
        editing,
        recentlyEdited,
        hovered,
        focused,
        increasing,
        valueIndicatorEnabled,
        differenceIndicatorEnabled,
        staticDifferenceIndicatorEnabled,
      ];
}
