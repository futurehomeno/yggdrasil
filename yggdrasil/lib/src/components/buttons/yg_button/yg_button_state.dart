part of buttons;

class _YgButtonState extends _YgButtonBaseState {
  _YgButtonState({
    super.focused,
    super.disabled,
    super.hovered,
    super.pressed,
    YgButtonVariant variant = YgButtonVariant.primary,
    YgButtonSize size = YgButtonSize.large,
  })  : variant = YgStateValue<YgButtonVariant>(variant),
        size = YgStateValue<YgButtonSize>(size);

  final YgStateValue<YgButtonVariant> variant;
  final YgStateValue<YgButtonSize> size;

  @override
  List<YgStateValue<Object?>> get props => <YgStateValue<Object?>>[
        ...super.props,
        variant,
        size,
      ];
}
