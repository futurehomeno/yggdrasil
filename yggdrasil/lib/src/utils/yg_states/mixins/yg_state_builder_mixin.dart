import 'package:flutter/material.dart' as m;
import 'package:yggdrasil/src/utils/_utils.dart';

/// Mixin to simplify working with [YgState].
mixin YgStateBuilderMixin<Widget extends m.StatefulWidget, State extends YgState> on m.State<Widget> {
  State? _state;

  State get state {
    State? state = _state;
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
  State createState();

  /// Updates the state with the properties on [widget].
  void updateState();
}
