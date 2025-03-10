part of buttons;

class _YgStepperButtonStyle extends _YgButtonBaseStyle<_YgStepperButtonState> {
  _YgStepperButtonStyle({
    required super.state,
    required super.vsync,
  });

  @override
  Curve get curve => Curves.easeInOut;

  @override
  Duration get duration => const Duration(milliseconds: 200);

  @override
  Color resolveColor() {
    return Colors.transparent;
  }

  @override
  BoxConstraints resolveConstraints() {
    final EdgeInsets padding = switch (state.size.value) {
      YgStepperButtonSize.large => _theme.paddingLarge,
      YgStepperButtonSize.medium => _theme.paddingMedium,
    };

    return BoxConstraints.tight(
      padding.inflateSize(
        Size.square(
          _theme.iconSize,
        ),
      ),
    );
  }

  @override
  double resolveIconSize() {
    return _theme.iconSize;
  }

  @override
  Color resolveIconColor() {
    if (state.disabled.value) {
      return _theme.disabledIconColor;
    }

    return _theme.iconColor;
  }

  @override
  Color resolveSplashColor() {
    return _theme.splashColor;
  }

  @override
  OutlinedBorder resolveOutlinedBorder() {
    if (state.disabled.value) {
      return YgRoundedRectangleGradientBorder(
        gradient: _theme.disabledBorderGradient,
        borderRadius: _theme.borderRadius,
        width: _theme.borderWidth,
      );
    }

    return YgRoundedRectangleGradientBorder(
      gradient: _theme.borderGradient,
      borderRadius: _theme.borderRadius,
      width: _theme.borderWidth,
    );
  }

  YgStepperButtonTheme get _theme => context.stepperButtonTheme;
}
