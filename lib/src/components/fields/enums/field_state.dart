enum FieldState {
  focused,
  hovered,
  disabled,
  error,
  filled,
}

typedef FieldStates = Set<FieldState>;

extension FieldStatesExtension on FieldStates {
  bool get focused => contains(FieldState.focused);
  bool get hovered => contains(FieldState.hovered);
  bool get disabled => contains(FieldState.disabled);
  bool get error => contains(FieldState.error);
  bool get filled => contains(FieldState.filled);
}
