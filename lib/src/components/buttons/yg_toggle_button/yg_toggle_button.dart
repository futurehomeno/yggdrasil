import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/buttons/widgets/_widgets.dart';
import 'package:yggdrasil/src/utils/_utils.dart';
import 'package:yggdrasil/yggdrasil.dart';

import '_yg_toggle_button.dart';
import 'yg_toggle_button_state.dart';
import 'yg_toggle_button_style.dart';

part 'variants/yg_toggle_button_with_leading_icon.dart';
part 'variants/yg_toggle_icon_button.dart';
part 'variants/yg_toggle_text_button.dart';

/// Yggdrasil toggle button.
abstract base class YgToggleButton extends YgButtonBase<YgToggleButtonState> with YgDualStateToggleableMixin {
  const factory YgToggleButton({
    Key? key,
    required bool value,
    required String text,
    required ValueChanged<bool>? onChanged,
    YgToggleButtonSize size,
    bool autofocus,
    FocusNode? focusNode,
    ValueChanged<bool>? onFocusChange,
    ValueChanged<bool>? onHover,
    VoidCallback? onLongPress,
  }) = _YgToggleTextButton;

  const factory YgToggleButton.onlyIcon({
    Key? key,
    required bool value,
    required String icon,
    required ValueChanged<bool>? onChanged,
    YgToggleButtonSize size,
    bool autofocus,
    FocusNode? focusNode,
    ValueChanged<bool>? onFocusChange,
    ValueChanged<bool>? onHover,
    VoidCallback? onLongPress,
  }) = _YgToggleIconButton;

  const factory YgToggleButton.leadingIcon({
    Key? key,
    required bool value,
    required String text,
    required String icon,
    required ValueChanged<bool>? onChanged,
    YgToggleButtonSize size,
    bool autofocus,
    FocusNode? focusNode,
    ValueChanged<bool>? onFocusChange,
    ValueChanged<bool>? onHover,
    VoidCallback? onLongPress,
  }) = _YgToggleButtonWithLeadingIcon;

  const YgToggleButton._({
    super.key,
    required this.value,
    required this.onChanged,
    this.size = YgToggleButtonSize.medium,
    super.autofocus,
    super.focusNode,
    super.onFocusChange,
    super.onHover,
    super.onLongPress,
  }) : super(onPressed: null);

  /// The current value of the button.
  @override
  final bool value;

  /// Callback to trigger when the value of the button changes.
  ///
  /// The button itself does not maintain any state. Instead, when the state of
  /// the button changes, the widget calls the [onChanged] callback.
  @override
  final ValueChanged<bool>? onChanged;

  /// The size of the toggle button.
  final YgToggleButtonSize size;

  @override
  YgDebugType get debugType {
    if (onChanged == null) {
      return YgDebugType.other;
    }

    return YgDebugType.intractable;
  }

  @override
  YgToggleButtonState createButtonState() {
    return YgToggleButtonState(
      disabled: disabled,
      size: size,
      variant: variant,
      toggled: value,
    );
  }

  @override
  void updateState(YgToggleButtonState state) {
    state.size.value = size;
    state.variant.value = variant;
    state.toggled.value = value;
  }

  @override
  YgButtonBaseStyle<YgToggleButtonState> createStyle(YgVsync vsync, YgToggleButtonState state) {
    return YgToggleButtonStyle(
      state: state,
      vsync: vsync,
    );
  }

  @override
  VoidCallback? get onPressed => toggle;

  YgToggleButtonVariant get variant;
}
