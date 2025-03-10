part of buttons;

class _YgSegmentedButtonSegmentState extends _YgButtonBaseState {
  _YgSegmentedButtonSegmentState({
    super.disabled,
    super.focused,
    super.hovered,
    super.pressed,
    bool selected = false,
  }) : selected = YgStateValue<bool>(selected);

  final YgStateValue<bool> selected;

  @override
  List<YgStateValue<Object?>> get props => <YgStateValue<Object?>>[
        ...super.props,
        selected,
      ];
}
