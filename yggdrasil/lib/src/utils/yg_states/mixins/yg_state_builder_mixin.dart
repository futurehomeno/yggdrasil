part of yg_states;

/// Mixin to simplify working with [YgState].
mixin YgStateBuilderMixin<Widget extends StatefulWidget, VisualState extends YgState> on State<Widget> {
  VisualState? _state;

  VisualState get state {
    VisualState? state = _state;
    if (state != null) {
      return state;
    }

    state = createState();
    _state = state;

    return state;
  }

  @override
  void didUpdateWidget(covariant Widget oldWidget) {
    updateState();
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    state.dispose();
    super.dispose();
  }

  /// Creates a state on init.
  VisualState createState();

  /// Updates the state with the properties on [widget].
  void updateState();
}
