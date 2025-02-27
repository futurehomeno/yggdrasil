part of 'yg_property.dart';

// ignore: avoid-dynamic
typedef YgDynamicDrivenProperty = YgDrivenProperty<dynamic>;
typedef ValueMapper<From, To> = To Function(From value);

/// The result of [YgProperty.drive].
///
/// Contains the result of [YgProperty.resolve] using the given [YgState] in
/// [value] and will notify its listeners when the resolved value changes.
abstract class YgDrivenProperty<V> implements ValueListenable<V> {
  const YgDrivenProperty();

  const factory YgDrivenProperty.all({
    required V value,
  }) = _YgDrivenPropertyAll<V>;

  /// The current value of this property.
  @override
  V get value;

  /// Creates a new property with its value mapped using [mapper].
  YgDrivenProperty<T> map<T>(ValueMapper<V, T> mapper);
}

/// Abstract class extended by driven properties that have to be disposed.
abstract class YgDisposableDrivenProperty<V> extends YgDrivenProperty<V> {
  /// Dispose of this property.
  ///
  /// Must be called when no longer using this property, otherwise it may lead
  /// to a memory leak. When using [YgStyle] this is done automatically when the
  /// style is disposed.
  void dispose();
}

class _YgDrivenProperty<T extends YgState, V> extends ChangeNotifier implements YgDisposableDrivenProperty<V> {
  _YgDrivenProperty({
    required T state,
    required YgVsync vsync,
    required YgProperty<T, V> property,
  })  : _property = property,
        _vsync = vsync,
        _state = state,
        _usesStates = property is! YgPropertyResolveAllMixin<T, V> {
    if (_usesStates) {
      _state.addListener(_handleChange);
    }
    _vsync.addDependenciesChangedListener(_handleChange);
  }

  @override
  void dispose() {
    if (_usesStates) {
      _state.removeListener(_handleChange);
    }
    _vsync.removeDependenciesChangedListener(_handleChange);
    super.dispose();
  }

  /// The state which drives this property.
  final T _state;

  /// The vsync, update and context provider.
  final YgVsync _vsync;

  /// The parent property.
  final YgProperty<T, V> _property;

  /// Whether the property will resolve to the same value no matter the state.
  final bool _usesStates;

  @override
  YgDrivenProperty<R> map<R>(ValueMapper<V, R> mapper) {
    return _YgMappedDrivenProperty<V, R>(
      mapper: mapper,
      parent: this,
    );
  }

  /// The current cached value.
  ///
  /// Gets cleared whenever the state updates. Gets set whenever the value is
  /// requested, if the value is never requested it will never be evaluated.
  V? _cachedValue;

  @override
  V get value {
    // When first getting the _cachedValue it should be null because we do not
    // want to resolve the value before it is requested, as this would mean the
    // resolve is called before first build, at which point we can not get the
    // theme yet.
    final V? value = _cachedValue;
    if (value != null) {
      return value;
    }

    final V newValue = _property.resolve(
      _vsync.context,
      _state,
    );
    _cachedValue = newValue;

    return newValue;
  }

  void _handleChange() {
    final V newValue = _property.resolve(
      _vsync.context,
      _state,
    );

    if (_cachedValue != newValue) {
      _cachedValue = newValue;
      notifyListeners();
    }
  }
}

class _YgMappedDrivenProperty<From, To> implements YgDrivenProperty<To> {
  const _YgMappedDrivenProperty({
    required this.parent,
    required this.mapper,
  });

  final YgDrivenProperty<From> parent;
  final ValueMapper<From, To> mapper;

  @override
  YgDrivenProperty<R> map<R>(ValueMapper<To, R> mapper) {
    return _YgMappedDrivenProperty<To, R>(
      mapper: mapper,
      parent: this,
    );
  }

  @override
  To get value => mapper(parent.value);

  @override
  void addListener(VoidCallback listener) {
    parent.addListener(listener);
  }

  @override
  void removeListener(VoidCallback listener) {
    parent.removeListener(listener);
  }
}
