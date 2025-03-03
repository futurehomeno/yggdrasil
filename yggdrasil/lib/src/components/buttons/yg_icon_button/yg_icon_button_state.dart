part of buttons;

class _YgIconButtonState extends _YgButtonBaseState {
  _YgIconButtonState({
    super.focused,
    super.disabled,
    super.hovered,
    super.pressed,
    YgIconButtonVariant variant = YgIconButtonVariant.standard,
    YgIconButtonSize size = YgIconButtonSize.medium,
  })  : variant = YgStateValue<YgIconButtonVariant>(variant),
        size = YgStateValue<YgIconButtonSize>(size);

  final YgStateValue<YgIconButtonVariant> variant;
  final YgStateValue<YgIconButtonSize> size;

  @override
  List<YgStateValue<Object?>> get props => <YgStateValue<Object?>>[
        ...super.props,
        variant,
        size,
      ];
}
