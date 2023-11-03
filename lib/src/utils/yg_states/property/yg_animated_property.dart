part of 'yg_property.dart';

/// The result of [YgProperty.animate].
///
/// Contains the result of [YgProperty.resolve] using the given [YgState] in
/// [value] and animates to a new value when the resolved value changes.
abstract class YgAnimatedProperty<V> implements Animation<V>, YgDrivenProperty<V> {
  const YgAnimatedProperty();

  @override
  YgAnimatedProperty<R> map<R>(ValueMapper<V, R> mapper);
}

/// Abstract class extended by animated properties that have to be disposed.
abstract class YgDisposableAnimatedProperty<V> extends YgAnimatedProperty<V> implements YgDisposableDrivenProperty<V> {}

class _YgAnimatedProperty<T extends YgState, V> extends Animation<V>
    with AnimationWithParentMixin<double>
    implements YgDisposableAnimatedProperty<V> {
  _YgAnimatedProperty({
    required YgVsync vsync,
    required Curve curve,
    required YgProperty<T, V> property,
    required T state,
    required Duration duration,
  })  : _state = state,
        _vsync = vsync,
        _curve = curve,
        _property = property,
        _animationController = AnimationController(
          vsync: vsync,
          duration: duration,
          value: 1.0,
        ),
        _tween = property.createTween(
          property.resolve(
            vsync.context,
            state,
          ),
        ) {
    _state.addListener(_handleStateChange);
    _vsync.addDependenciesChangedListener(_handleDependenciesChange);
    _animationController.addListener(_handleAnimationTick);
  }

  /// Internal animation controller
  ///
  /// Drives the animations between values.
  final AnimationController _animationController;

  /// The tween used for interpolating between values.
  final Tween<V> _tween;

  /// The state which is used for resolving the [_property].
  final T _state;

  /// Provides a [BuildContext], implements [TickerProvider] and notifies about
  /// dependency changes.
  final YgVsync _vsync;

  /// Curve applied to the [_animationController] value.
  final Curve _curve;

  /// The property which created this animated property.
  ///
  /// Gets used to resolve the value of this animated property.
  final YgProperty<T, V> _property;

  /// The current cached value.
  ///
  /// Gets cleared whenever the animation updates. Gets set whenever the value
  /// is requested, if the value is never requested it will never be evaluated.
  V? _cachedValue;

  @override
  Animation<double> get parent => _animationController;

  @override
  V get value {
    final V? value = _cachedValue;
    if (value != null) {
      return value;
    }

    final V newValue = _tween.transform(
      _curve.transform(
        _animationController.value,
      ),
    );
    _cachedValue = newValue;

    return newValue;
  }

  @override
  void dispose() {
    _state.removeListener(_handleStateChange);
    _vsync.removeDependenciesChangedListener(_handleDependenciesChange);
    _animationController.removeListener(_handleAnimationTick);
    _animationController.dispose();
  }

  @override
  YgAnimatedProperty<R> map<R>(ValueMapper<V, R> mapper) {
    return _YgMappedAnimatedProperty<V, R>(
      parent: this,
      mapper: mapper,
    );
  }

  void _handleStateChange() {
    final BuildContext context = _vsync.context;

    final V target = _property.resolve(
      context,
      _state,
    );

    _tween.begin = _tween.evaluate(_animationController);
    _tween.end = target;
    _animationController.forward(from: 0);
  }

  void _handleDependenciesChange() {
    final BuildContext context = _vsync.context;

    final V target = _property.resolve(
      context,
      _state,
    );

    final bool shouldUpdate = _tween.end != target;

    if (shouldUpdate) {
      _tween.end = target;

      // We have to update the listeners because the value of one of the child
      // animations changed, even though the animation did not advance.
      // ignore: invalid_use_of_protected_member
      _animationController.notifyListeners();
    }
  }

  void _handleAnimationTick() {
    _cachedValue = null;
  }
}

class _YgMappedAnimatedProperty<From, To> extends Animation<To>
    with AnimationWithParentMixin<From>
    implements YgAnimatedProperty<To> {
  const _YgMappedAnimatedProperty({
    required this.parent,
    required this.mapper,
  });

  @override
  final YgAnimatedProperty<From> parent;
  final ValueMapper<From, To> mapper;

  @override
  YgAnimatedProperty<R> map<R>(ValueMapper<To, R> mapper) {
    return _YgMappedAnimatedProperty<To, R>(
      parent: this,
      mapper: mapper,
    );
  }

  @override
  To get value => mapper(parent.value);
}
