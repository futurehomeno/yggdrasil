part of 'yg_property.dart';

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
    required YgUpdateMixin<StatefulWidget> vsync,
    required YgProperty<T, V> property,
  })  : _property = property,
        _vsync = vsync,
        _controller = controller,
        super(
          property.resolve(
            vsync.context,
            controller.value,
          ),
        ) {
    _controller.addListener(_handleChange);
    _vsync.addDependenciesChangedListener(_handleChange);
  }

  @override
  void dispose() {
    _controller.removeListener(_handleChange);
    _vsync.removeDependenciesChangedListener(_handleChange);
    super.dispose();
  }

  final YgStatesController<T> _controller;
  final YgUpdateMixin _vsync;
  final YgProperty<T, V> _property;

  void _handleChange() {
    final Set<T> states = _controller.value;
    final BuildContext context = _vsync.context;

    value = _property.resolve(
      context,
      states,
    );
  }
}
