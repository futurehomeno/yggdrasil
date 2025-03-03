part of buttons;

/// Implementation of the button used specifically in [YgStepper].
class YgStepperButton extends _YgButtonBase<_YgStepperButtonState> {
  const YgStepperButton({
    super.key,
    required this.icon,
    super.onPressed,
    super.onLongPress,
    super.onHover,
    super.onFocusChange,
    super.focusNode,
    super.autofocus = false,
    super.onTapEnd,
    super.onTapStart,
    this.size = YgStepperButtonSize.large,
    this.disabled = false,
  });

  /// Widget under this widget in the widget tree.
  final YgColorableIconData icon;

  /// The size of the stepper button.
  final YgStepperButtonSize size;

  @override
  _YgStepperButtonState createButtonState() {
    return _YgStepperButtonState(
      disabled: disabled,
      size: size,
    );
  }

  @override
  void updateState(_YgStepperButtonState state) {
    state.disabled.value = disabled;
    state.size.value = size;
  }

  @override
  final bool disabled;

  @override
  _YgButtonBaseStyle<_YgStepperButtonState> createStyle(YgVsync vsync, _YgStepperButtonState state) {
    return _YgStepperButtonStyle(
      state: state,
      vsync: vsync,
    );
  }

  @override
  Widget buildChild(BuildContext context) {
    return YgIcon(icon);
  }
}
