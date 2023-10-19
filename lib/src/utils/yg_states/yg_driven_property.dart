part of 'yg_property.dart';

// ignore: avoid-dynamic
typedef YgDynamicDrivenProperty = YgDrivenProperty<dynamic>;

/// The result of [YgProperty.drive].
///
/// Contains the result of [YgProperty.resolve] using the given
/// [YgStatesController] in [value] and will notify its listeners when the
/// resolved value changes.
abstract class YgDrivenProperty<V> implements Listenable {
  const YgDrivenProperty();

  void dispose();

  V get value;
}

class _YgDrivenProperty<T extends Enum, V> extends ValueNotifier<V> implements YgDrivenProperty<V> {
  _YgDrivenProperty({
    required YgStatesController<T> controller,
    required YgVsync vsync,
    required YgProperty<T, V> property,
  })  : _property = property,
        _vsync = vsync,
        _controller = controller,
        _usesStates = property is! YgPropertyResolveAllMixin<T, V>,
        super(
          property.resolve(
            vsync.context,
            controller.value,
          ),
        ) {
    if (_usesStates) {
      _controller.addListener(_handleChange);
    }
    _vsync.addDependenciesChangedListener(_handleChange);
  }

  @override
  void dispose() {
    if (_usesStates) {
      _controller.addListener(_handleChange);
    }
    _controller.removeListener(_handleChange);
    _vsync.removeDependenciesChangedListener(_handleChange);
    super.dispose();
  }

  /// The states controller which drives this property.
  final YgStatesController<T> _controller;

  /// The vsync, update and context provider.
  final YgVsync _vsync;

  /// The parent property.
  final YgProperty<T, V> _property;

  /// Whether the property will resolve to the same value no matter the states.
  final bool _usesStates;

  void _handleChange() {
    final Set<T> states = _controller.value;
    final BuildContext context = _vsync.context;

    value = _property.resolve(
      context,
      states,
    );
  }
}
