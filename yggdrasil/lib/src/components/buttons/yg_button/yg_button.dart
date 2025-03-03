part of buttons;

/// Base class for creating all Yg buttons.
class YgButton extends _YgButtonBase<_YgButtonState> {
  const YgButton({
    super.key,
    required this.child,
    required super.onPressed,
    super.onLongPress,
    super.onHover,
    super.onFocusChange,
    super.focusNode,
    super.autofocus = false,
    this.size = YgButtonSize.medium,
    this.variant = YgButtonVariant.primary,
  });

  /// Button with a leading icon
  const factory YgButton.leadingIcon({
    bool autofocus,
    required Widget child,
    FocusNode? focusNode,
    required YgColorableIconData icon,
    Key? key,
    void Function(bool)? onFocusChange,
    void Function(bool)? onHover,
    void Function()? onLongPress,
    required void Function()? onPressed,
    YgButtonSize size,
    YgButtonVariant variant,
  }) = _YgButtonWithLeadingIcon;

  /// Button with a trailing icon.
  const factory YgButton.trailingIcon({
    bool autofocus,
    required Widget child,
    FocusNode? focusNode,
    required YgColorableIconData icon,
    Key? key,
    void Function(bool)? onFocusChange,
    void Function(bool)? onHover,
    void Function()? onLongPress,
    required void Function()? onPressed,
    YgButtonSize size,
    YgButtonVariant variant,
  }) = _YgButtonWithTrailingIcon;

  /// The variant of the button.
  ///
  /// For specific info see [YgButtonVariant].
  final YgButtonVariant variant;

  /// The size of the button.
  ///
  /// For specific info see [YgButtonSize].
  final YgButtonSize size;

  /// The widget rendered under this widget in the widget tree.
  final Widget child;

  @override
  _YgButtonState createButtonState() {
    return _YgButtonState(
      disabled: onPressed == null,
      size: size,
      variant: variant,
    );
  }

  @override
  void updateState(_YgButtonState state) {
    state.size.value = size;
    state.variant.value = variant;
  }

  @override
  _YgButtonBaseStyle<_YgButtonState> createStyle(YgVsync vsync, _YgButtonState state) {
    return _YgButtonStyle(
      state: state,
      vsync: vsync,
    );
  }

  @override
  Widget buildChild(BuildContext context) {
    final YgButtonTheme theme = context.buttonTheme;

    return Padding(
      padding: theme.contentPadding,
      child: child,
    );
  }
}
