import 'package:flutter/material.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

mixin YgStatesSubscriberMixin<T extends Enum, W extends StatefulWidget> on State<W> {
  YgStatesController<T> get controller;

  Set<T>? get subscribedStates;

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
