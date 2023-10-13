import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

typedef AllResolver<T> = T Function(BuildContext context);

abstract class YgProperty<T extends Enum, V> implements Listenable {
  const YgProperty();

  factory YgProperty.all(
    AllResolver<V> resolver,
  ) = _YgPropertyAll<T, V>;

  factory YgProperty.resolveWith(
    YgPropertyResolver<T, V> resolver,
  ) = _YgPropertyResolveWith<T, V>;

  V resolve(
    BuildContext context,
    Set<T> states,
  );

  V get value;
}

class _YgPropertyAll<T extends Enum, V> extends ChangeNotifier implements YgProperty<T, V> {
  _YgPropertyAll(this._resolver);

  final AllResolver<V> _resolver;

  V? _value;

  @override
  V resolve(BuildContext context, Set<T> states) {
    final V resolved = _resolver(context);
    if (_value != resolved) {
      _value = resolved;
      notifyListeners();
    }

    return resolved;
  }

  @override
  V get value {
    assert(
      _value != null,
      'value was accessed before ${toString()} was initialized',
    );

    return _value!;
  }
}

class _YgPropertyResolveWith<T extends Enum, V> extends ChangeNotifier implements YgProperty<T, V> {
  _YgPropertyResolveWith(this._resolver);

  final YgPropertyResolver<T, V> _resolver;

  V? _value;

  @override
  V resolve(BuildContext context, Set<T> states) {
    final V resolved = _resolver(context, states);
    if (_value != resolved) {
      _value = resolved;
      notifyListeners();
    }

    return resolved;
  }

  @override
  V get value {
    assert(
      _value != null,
      'value was accessed before ${toString()} was initialized',
    );

    return _value!;
  }
}
