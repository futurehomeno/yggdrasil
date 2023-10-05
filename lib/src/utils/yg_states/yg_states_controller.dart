import 'package:flutter/material.dart';

class YgStatesController<T extends Enum> extends ChangeNotifier {
  YgStatesController([
    Set<T>? initialStates,
  ]) : _states = initialStates ?? <T>{};

  /// The current states of the controller.
  final Set<T> _states;
  Set<T> get states => _states;

  /// Toggles a state.
  ///
  /// Returns true if the state was added, false if it was removed.
  bool toggleState(T state) {
    final bool added = _states.add(state);

    if (!added) {
      _states.remove(state);
    }

    notifyListeners();

    return added;
  }

  bool removeState(T state) {
    final bool removed = _states.remove(state);

    if (removed) {
      notifyListeners();
    }

    return removed;
  }

  bool addState(T state) {
    final bool added = _states.add(state);

    if (added) {
      notifyListeners();
    }

    return added;
  }

  void update(T state, bool toggled) {
    final bool valueChanged = toggled ? _states.add(state) : _states.remove(state);
    if (valueChanged) {
      notifyListeners();
    }
  }
}
