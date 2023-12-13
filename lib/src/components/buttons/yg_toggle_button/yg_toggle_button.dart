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

/// Button that can be toggled between enabled or disabled.
///
/// Functionality-wise, this is similar to a checkbox, but the use-case is
/// different and this widget does not have a tri-state variant.
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

  /// The [YgToggleButton] equivalent of an icon button.
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

  /// Shows an [icon] leading the [text].
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

  /// Callback to triggered when the value of the button changes.
  ///
  /// The button itself does not maintain any state. Instead, when the state of
  /// the button changes, the widget calls the [onChanged] callback.
  @override
  final ValueChanged<bool>? onChanged;

  /// The size of the toggle button.
  final YgToggleButtonSize size;

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

  /// The variant of the widget.
  ///
  /// Not specified by the user as a argument but provided by the different
  /// implementations of [YgToggleButton].
  YgToggleButtonVariant get variant;
}
