part of 'yg_property.dart';

/// The result of [YgProperty.animate].
///
/// Contains the result of [YgProperty.resolve] using the given
/// [YgStatesController] in [value] and animates to a new value when the
/// resolved value changes.
abstract class YgAnimatedProperty<V> implements Animation<V>, YgDrivenProperty<V> {
  const YgAnimatedProperty();
}

class _YgAnimatedProperty<T extends Enum, V> extends Animation<V>
    with AnimationWithParentMixin<double>
    implements YgAnimatedProperty<V> {
  _YgAnimatedProperty({
    required YgVsync vsync,
    required Curve curve,
    required YgProperty<T, V> property,
    required YgStatesController<T> controller,
    required Duration duration,
  })  : _statesController = controller,
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
            controller.value,
          ),
        ) {
    _statesController.addListener(_handleStateChange);
    _vsync.addDependenciesChangedListener(_handleDependenciesChange);
  }

  final AnimationController _animationController;
  final Tween<V> _tween;
  final YgStatesController<T> _statesController;
  final YgVsync _vsync;
  final Curve _curve;
  final YgProperty<T, V> _property;

  @override
  Animation<double> get parent => _animationController;

  @override
  V get value => _tween.transform(
        _curve.transform(
          _animationController.value,
        ),
      );

  @override
  void dispose() {
    _statesController.removeListener(_handleStateChange);
    _vsync.removeDependenciesChangedListener(_handleDependenciesChange);
    _animationController.dispose();
  }

  void _handleStateChange() {
    final Set<T> states = _statesController.value;
    final Set<T> previousStates = _statesController.previous;
    final BuildContext context = _vsync.context;

    final V previous = _property.resolve(
      context,
      previousStates,
    );

    final V target = _property.resolve(
      context,
      states,
    );

    final bool changed = previous != target;

    if (changed) {
      _tween.begin = _tween.evaluate(_animationController);
      _tween.end = target;
      _animationController.forward(from: 0);
    }
  }

  void _handleDependenciesChange() {
    final Set<T> states = _statesController.value;
    final BuildContext context = _vsync.context;

    final V target = _property.resolve(
      context,
      states,
    );

    final bool shouldUpdate = _tween.end != target;

    if (shouldUpdate) {
      _tween.end = target;

      // We have to update the listeners because the value of on of the child
      // animations changed, even though the animation did not advance.
      // ignore: invalid_use_of_protected_member
      _animationController.notifyListeners();
    }
  }
}
