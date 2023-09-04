/// The action which gets performed when the user finishes editing a field.
enum YgCompleteAction {
  /// Moves focus over to the next form field.
  focusNext,

  /// Moves focus over to the previous form field.
  focusPrevious,

  /// Removes focus from the form field.
  unfocus,

  /// Do nothing. Maintain focus.
  none,
}
