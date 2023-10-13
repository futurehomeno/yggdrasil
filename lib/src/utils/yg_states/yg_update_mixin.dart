import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@optionalTypeArgs
mixin YgUpdateMixin<T extends StatefulWidget> on TickerProviderStateMixin<T> {
  final ObserverList<VoidCallback> _listeners = ObserverList<VoidCallback>();

  @override
  void didChangeDependencies() {
    for (final VoidCallback listener in _listeners) {
      listener();
    }

    super.didChangeDependencies();
  }

  void addDependenciesChangedListener(VoidCallback callback) {
    _listeners.add(callback);
  }

  void removeDependenciesChangedListener(VoidCallback callback) {
    _listeners.remove(callback);
  }
}
