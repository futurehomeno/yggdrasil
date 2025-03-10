part of buttons;

class _YgTagState extends _YgButtonBaseState {
  _YgTagState({
    super.disabled,
    super.focused,
    super.hovered,
    super.pressed,
    YgTagWeight weight = YgTagWeight.weak,
    YgTagVariant variant = YgTagVariant.neutral,
    YgTagSize size = YgTagSize.medium,
  })  : weight = YgStateValue<YgTagWeight>(weight),
        variant = YgStateValue<YgTagVariant>(variant),
        size = YgStateValue<YgTagSize>(size);

  final YgStateValue<YgTagWeight> weight;
  final YgStateValue<YgTagVariant> variant;
  final YgStateValue<YgTagSize> size;

  @override
  List<YgStateValue<Object?>> get props => <YgStateValue<Object?>>[
        ...super.props,
        weight,
        variant,
        size,
      ];
}
