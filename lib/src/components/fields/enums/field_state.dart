enum FieldState {
  focused,
  hovered,
  disabled,
  error,
  filled,
  opened,
}

typedef FieldStates = Set<FieldState>;

extension FieldStatesExtension on FieldStates {
  bool get focused => contains(FieldState.focused);
  bool get hovered => contains(FieldState.hovered);
  bool get disabled => contains(FieldState.disabled);
  bool get error => contains(FieldState.error);
  bool get filled => contains(FieldState.filled);
  bool get opened => contains(FieldState.opened);

  FieldStates without(FieldState state) {
    final FieldStates result = <FieldState>{};

    for (final FieldState $state in this) {
      if ($state != state) {
        result.add($state);
      }
    }

    return result;
  }
}
