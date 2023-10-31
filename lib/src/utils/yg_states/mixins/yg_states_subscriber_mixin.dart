import 'package:flutter/material.dart';
import 'package:yggdrasil/src/utils/yg_states/_yg_states.dart';

/// Mixin to link a state to a [YgStatesController].
///
/// Will make the widget rebuilt when the states change, when [subscribedStates]
/// are defined will only update the widget when any of the states in the set
/// are updated.
mixin YgStatesSubscriberMixin<T extends Enum, W extends StatefulWidget> on State<W> {
  /// The controller which drives the rebuilding of this widget.
  YgStatesController<T> get controller;

  /// A set of states which when provided will be the only states that may
  /// trigger a rebuild.
  Set<T>? get subscribedStates => null;

  @override
  void initState() {
    super.initState();
    controller.addListener(_maybeRebuild);
  }

  @override
  void dispose() {
    controller.removeListener(_maybeRebuild);
    super.dispose();
  }

  void _maybeRebuild() {
    final Set<T>? subscribedStates = this.subscribedStates;
    final StatesChange<T> change = controller.lastChange;

    final bool shouldUpdate = subscribedStates == null ||
        change.added.any(subscribedStates.contains) ||
        change.removed.any(subscribedStates.contains);

    if (shouldUpdate) {
      setState(() {});
    }
  }
}
