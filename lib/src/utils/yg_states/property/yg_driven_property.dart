part of 'yg_property.dart';

// ignore: avoid-dynamic
typedef YgDynamicDrivenProperty = YgDrivenProperty<dynamic>;
typedef ValueMapper<From, To> = To Function(From value);

/// The result of [YgProperty.drive].
///
/// Contains the result of [YgProperty.resolve] using the given
/// [YgStatesController] in [value] and will notify its listeners when the
/// resolved value changes.
abstract class YgDrivenProperty<V> implements Listenable {
  const YgDrivenProperty();

  const factory YgDrivenProperty.all({
    required V value,
  }) = _YgDrivenPropertyAll<V>;

  /// The current value of this property.
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

class _YgDrivenProperty<T extends YgState, V> extends ValueNotifier<V> implements YgDisposableDrivenProperty<V> {
  _YgDrivenProperty({
    required T state,
    required YgVsync vsync,
    required YgProperty<T, V> property,
  })  : _property = property,
        _vsync = vsync,
        _state = state,
        _usesStates = property is! YgPropertyResolveAllMixin<T, V>,
        super(
          property.resolve(
            vsync.context,
            state,
          ),
        ) {
    if (_usesStates) {
      _state.addListener(_handleChange);
    }
    _vsync.addDependenciesChangedListener(_handleChange);
  }

  @override
  void dispose() {
    if (_usesStates) {
      _state.addListener(_handleChange);
    }
    _state.removeListener(_handleChange);
    _vsync.removeDependenciesChangedListener(_handleChange);
    super.dispose();
  }

  /// The states controller which drives this property.
  final T _state;

  /// The vsync, update and context provider.
  final YgVsync _vsync;

  /// The parent property.
  final YgProperty<T, V> _property;

  /// Whether the property will resolve to the same value no matter the states.
  final bool _usesStates;

  void _handleChange() {
    final BuildContext context = _vsync.context;

    value = _property.resolve(
      context,
      _state,
    );
  }

  @override
  YgDrivenProperty<R> map<R>(ValueMapper<V, R> mapper) {
    return _YgMappedDrivenProperty<V, R>(
      mapper: mapper,
      parent: this,
    );
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
