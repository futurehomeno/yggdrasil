enum YgButtonState {
  pressed,
  hovered,
  disabled,
}

extension YgButtonStateSetExtension on Set<YgButtonState> {
  bool get pressed => contains(YgButtonState.pressed);
  bool get hovered => contains(YgButtonState.hovered);
  bool get disabled => contains(YgButtonState.disabled);
}
