/// All the states any yggdrasil field can be in.
enum FieldState {
  focused,
  hovered,
  disabled,
  error,
  filled,
  opened,
}

/// A set of [FieldState]s.
typedef FieldStates = Set<FieldState>;

// TODO(DEV-1654): This does not seem like the best pattern, but i don't really have
// a good alternative yet, probably find a better pattern when implementing
// state based animated widget.
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
