part of yg_states;


/// A convenience class for creating a YgState with only a variant.
///
/// Not intended to be extended, when creating more complex state extend
/// [YgState] instead.
class YgVariantState<T extends Enum> extends YgState {
  YgVariantState({
    required T variant,
  }) : variant = YgStateValue<T>(variant);

  final YgStateValue<T> variant;

  @override
  List<YgStateValue<Object?>> get props => <YgStateValue<Object?>>[
        variant,
      ];
}
