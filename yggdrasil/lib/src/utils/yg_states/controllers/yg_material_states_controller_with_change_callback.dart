part of yg_states;


/// A material states controller which notifies you about state changes.
class YgMaterialStatesControllerWithChangeCallback extends WidgetStatesController {
  YgMaterialStatesControllerWithChangeCallback({
    required this.onStateChange,
  });

  /// Callback gets called when any state changes.
  ///
  /// Gets called with the state and the new value of the state.
  final void Function(WidgetState state, bool add) onStateChange;

  @override
  void update(WidgetState state, bool add) {
    super.update(state, add);
    onStateChange(state, add);
  }
}
