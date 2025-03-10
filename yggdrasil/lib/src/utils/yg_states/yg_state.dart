part of yg_states;




/// A base class for every Yggdrasil widget which has to maintain its own state.
///
/// [props] has to be overwritten and has to return a list with every
/// [YgStateValue]. This ensures you can listen to just the state when you want
/// to know about any single state change. Also automatically disposes of the
/// properties when the state gets disposed.
abstract class YgState extends ChangeNotifier {
  YgState() {
    for (final YgStateValue<Object?> prop in props) {
      prop.addListener(_scheduleUpdate);
    }
  }

  bool _scheduledUpdate = false;

  /// Debounce the updates.
  void _scheduleUpdate() {
    if (_scheduledUpdate) {
      return;
    }

    _scheduledUpdate = true;

    scheduleMicrotask(() {
      _scheduledUpdate = false;

      if (hasListeners) {
        notifyListeners();
      }
    });
  }

  @override
  void dispose() {
    for (final YgStateValue<Object?> value in props) {
      value.dispose();
    }
    super.dispose();
  }

  List<YgStateValue<Object?>> get props;
}
