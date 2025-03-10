part of yg_states;


/// Adds the YgVsync interface to a widget state.
@optionalTypeArgs
mixin YgVsyncMixin<T extends StatefulWidget> on TickerProviderStateMixin<T> implements YgVsync {
  final ObserverList<VoidCallback> _listeners = ObserverList<VoidCallback>();

  @override
  void didChangeDependencies() {
    for (final VoidCallback listener in _listeners) {
      listener();
    }

    super.didChangeDependencies();
  }

  @override
  void addDependenciesChangedListener(VoidCallback callback) {
    _listeners.add(callback);
  }

  @override
  void removeDependenciesChangedListener(VoidCallback callback) {
    _listeners.remove(callback);
  }
}
