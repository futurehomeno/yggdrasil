import 'dart:collection';

import 'package:flutter/material.dart';

class YgStatesController<T extends Enum> extends ChangeNotifier {
  YgStatesController([
    Set<T>? initialStates,
  ]) {
    _states = Set<T>.of(initialStates ?? <T>{});
    _statesView = UnmodifiableSetView<T>(_states);
    _previousStates = Set<T>.of(_states);
    _previousStatesView = UnmodifiableSetView<T>(_previousStates);
    _lastChange = StatesChange<T>(
      added: <T>{},
      removed: <T>{},
    );
  }

  /// The last action applied to the states set.
  StatesChange<T> get lastChange => _lastChange;
  late StatesChange<T> _lastChange;

  late Set<T> _states;
  late UnmodifiableSetView<T> _statesView;

  /// The current set of states.
  ///
  /// The set can not be modified to prevent unwanted behavior as modifying the
  /// set would not update this controller. You can however set a new
  Set<T> get value => _statesView;

  set value(Set<T> newValue) {
    final Set<T> added = newValue.difference(value);
    final Set<T> removed = _states.difference(newValue);

    _states.addAll(added);
    _states.removeAll(removed);

    _lastChange = StatesChange<T>(
      added: added,
      removed: removed,
    );
  }

  /// A Set of states which is kept in sync with [_states], except it is one
  /// change behind.
  late Set<T> _previousStates;

  /// The view of [_previousStates].
  ///
  /// Should never be user modified because it serves as a reference point to
  /// the previous states of this controller.
  late UnmodifiableSetView<T> _previousStatesView;

  /// The previous set of states.
  ///
  /// Useful for checking if certain states have changed.
  ///
  /// Also used to check if there is a difference between resolved values given
  /// the new states.
  Set<T> get previous => _previousStatesView;

  /// Toggles a state.
  ///
  /// Returns true if the state was added, false if it was removed.
  bool toggleState(T state) {
    final bool added = _states.add(state);

    if (!added) {
      _states.remove(state);
    }

    _updatePreviousStates(
      StatesChange<T>.fromUpdate(state, added),
    );
    notifyListeners();

    return added;
  }

  /// Removes a state to the set of current states.
  ///
  /// If the state wasn't already removed, notifies listeners and returns true,
  /// otherwise returns false.
  bool removeState(T state) {
    final bool removed = _states.remove(state);

    if (removed) {
      _updatePreviousStates(
        StatesChange<T>.fromUpdate(state, false),
      );
      notifyListeners();
    }

    return removed;
  }

  /// Adds a state to the set of current states.
  ///
  /// If the state wasn't already added, notifies listeners and returns true,
  /// otherwise returns false.
  bool addState(T state) {
    final bool added = _states.add(state);

    if (added) {
      _updatePreviousStates(
        StatesChange<T>.fromUpdate(state, true),
      );
      notifyListeners();
    }

    return added;
  }

  /// Updates a state.
  ///
  /// Only notifies listeners if the update actually created any changes.
  void update(T state, bool toggled) {
    final bool valueChanged = toggled ? _states.add(state) : _states.remove(state);
    if (valueChanged) {
      print('toggled: $toggled, state: $state');
      _updatePreviousStates(
        StatesChange<T>.fromUpdate(state, toggled),
      );
      notifyListeners();
    }
  }

  /// Convenience method for [value.contains];
  bool contains(T state) => _states.contains(state);

  /// Applies [_lastChange] to [_previousStates].
  void _updatePreviousStates(StatesChange<T> currentAction) {
    final StatesChange<T> lastChange = _lastChange;

    _previousStates.removeAll(lastChange.removed);
    _previousStates.addAll(lastChange.added);

    _lastChange = currentAction;
  }
}

/// A [YgStatesController] which implements [MaterialStatesController].
class YgMaterialStatesController extends YgStatesController<MaterialState> implements MaterialStatesController {}

class StatesChange<T extends Enum> {
  factory StatesChange({
    required Set<T> added,
    required Set<T> removed,
  }) {
    return StatesChange<T>._(
      added: Set<T>.unmodifiable(added),
      removed: Set<T>.unmodifiable(removed),
    );
  }

  factory StatesChange.fromUpdate(T state, bool toggled) {
    return StatesChange<T>._(
      added: Set<T>.unmodifiable(<T>{
        if (toggled) state,
      }),
      removed: Set<T>.unmodifiable(<T>{
        if (!toggled) state,
      }),
    );
  }

  const StatesChange._({
    required this.added,
    required this.removed,
  });

  final Set<T> added;
  final Set<T> removed;

  bool contains(T state) {
    return added.contains(state) || removed.contains(state);
  }
}
