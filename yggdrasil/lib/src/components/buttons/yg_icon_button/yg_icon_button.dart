part of buttons;

/// Base class for creating all YgIconButtons.
class YgIconButton extends _YgButtonBase<_YgIconButtonState> {
  const YgIconButton({
    super.key,
    required this.icon,
    required super.onPressed,
    super.onLongPress,
    super.onHover,
    super.onFocusChange,
    super.focusNode,
    super.autofocus = false,
    this.size = YgIconButtonSize.medium,
    this.variant = YgIconButtonVariant.standard,
  });

  final YgIconButtonVariant variant;
  final YgIconButtonSize size;
  final YgColorableIconData icon;

  @override
  _YgIconButtonState createButtonState() {
    return _YgIconButtonState(
      disabled: onPressed == null,
      size: size,
      variant: variant,
    );
  }

  @override
  void updateState(_YgIconButtonState state) {
    state.disabled.value = onPressed == null;
    state.variant.value = variant;
    state.size.value = size;
  }

  @override
  _YgButtonBaseStyle<_YgIconButtonState> createStyle(YgVsync vsync, _YgIconButtonState state) {
    return _YgIconButtonStyle(
      state: state,
      vsync: vsync,
    );
  }

  @override
  Widget buildChild(BuildContext context) {
    return YgIcon(icon);
  }
}
