part of buttons;

/// An avatar usually representing a user or a company.
///
/// Typically used with a user's profile image, or the user's initials.
/// If [image] is passed, [initials] are not shown.
class YgAvatar extends _YgButtonBase<_YgAvatarState> {
  const YgAvatar({
    super.key,
    required this.initials,
    super.autofocus,
    super.focusNode,
    super.onFocusChange,
    super.onHover,
    super.onLongPress,
    super.onPressed,
    this.size = YgAvatarSize.small,
    this.variant = YgAvatarVariant.person,
    this.image,
  });

  /// The variant of the avatar.
  final YgAvatarVariant variant;

  /// The size of the avatar.
  final YgAvatarSize size;

  /// The initials shown in the widget.
  ///
  /// Should normally only show the first character of the first name.
  final String initials;

  /// The image shown in the avatar.
  final Widget? image;

  @override
  Widget buildChild(BuildContext context) {
    if (image != null) {
      return const SizedBox();
    }

    return Text(
      initials,
    );
  }

  @override
  Widget? buildBackground(BuildContext context) {
    return image;
  }

  @override
  _YgAvatarState createButtonState() {
    return _YgAvatarState(
      disabled: disabled,
      image: image != null,
      size: size,
      variant: variant,
    );
  }

  @override
  _YgButtonBaseStyle<_YgAvatarState> createStyle(YgVsync vsync, _YgAvatarState state) {
    return _YgAvatarStyle(
      state: state,
      vsync: vsync,
    );
  }

  @override
  void updateState(_YgAvatarState state) {
    state.disabled.value = disabled;
    state.image.value = image != null;
    state.size.value = size;
    state.variant.value = variant;
  }
}
