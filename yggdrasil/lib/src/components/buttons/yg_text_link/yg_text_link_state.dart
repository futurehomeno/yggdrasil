part of buttons;

class _YgTextLinkState extends _YgButtonBaseState {
  _YgTextLinkState({
    super.disabled,
    super.focused,
    super.hovered,
    super.pressed,
    YgTextLinkWeight weight = YgTextLinkWeight.weak,
    YgTextLinkSize size = YgTextLinkSize.medium,
  })  : weight = YgStateValue<YgTextLinkWeight>(weight),
        size = YgStateValue<YgTextLinkSize>(size);

  final YgStateValue<YgTextLinkWeight> weight;
  final YgStateValue<YgTextLinkSize> size;

  @override
  List<YgStateValue<Object?>> get props => <YgStateValue<Object?>>[
        ...super.props,
        weight,
        size,
      ];
}
