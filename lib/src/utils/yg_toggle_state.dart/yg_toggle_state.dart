import 'package:yggdrasil/src/utils/_utils.dart';

class YgToggleState extends YgState {
  YgToggleState({
    bool toggled = false,
  }) : toggled = YgStateValue<bool>(toggled);

  final YgStateValue<bool> toggled;

  @override
  List<YgStateValue<Object>> get props => <YgStateValue<Object>>[
        toggled,
      ];

  void toggle() {
    toggled.value ^= true;
  }
}

class YgToggleTriState extends YgState {
  YgToggleTriState({
    bool? toggled = false,
  }) : toggled = YgStateValue<bool?>(toggled);

  final YgStateValue<bool?> toggled;

  @override
  List<YgStateValue<Object?>> get props => <YgStateValue<Object?>>[
        toggled,
      ];

  void toggle() {
    toggled.value = switch (toggled.value) {
      false => true,
      true => null,
      null => false,
    };
  }
}
