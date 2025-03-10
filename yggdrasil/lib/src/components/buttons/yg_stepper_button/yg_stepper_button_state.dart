part of buttons;

class _YgStepperButtonState extends _YgButtonBaseState {
  _YgStepperButtonState({
    super.disabled,
    super.focused,
    super.hovered,
    super.pressed,
    YgStepperButtonSize size = YgStepperButtonSize.large,
  }) : size = YgStateValue<YgStepperButtonSize>(size);

  final YgStateValue<YgStepperButtonSize> size;

  @override
  List<YgStateValue<Object?>> get props => <YgStateValue<Object?>>[
        ...super.props,
        size,
      ];
}
