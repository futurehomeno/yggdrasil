import 'package:flutter/material.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

/// Mixin to simplify working with [YgStyle].
mixin YgStateAndStyleBuilderMixin<Widget extends StatefulWidget, State extends YgState,
    Style extends YgStyleBase<State>> on YgStyleBuilderMixin<Widget, Style> {
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

  void updateState();
}
