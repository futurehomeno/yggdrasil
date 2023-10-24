part of 'yg_style_base.dart';

abstract class YgStyle<T extends Enum> extends YgStyleBase<T> {
  YgStyle({
    required super.controller,
    required super.vsync,
  });

  YgAnimatedProperty<V> animate<V>(
    YgProperty<T, V> property, {
    required Duration duration,
    required Curve curve,
  }) {
    final YgDisposableAnimatedProperty<V> listenable = property.animate(
      controller: controller,
      vsync: vsync,
      curve: curve,
      duration: duration,
    );

    _properties.add(listenable);
    listenable.addListener(notifyListeners);

    return listenable;
  }

  YgDrivenProperty<V> drive<V>(YgProperty<T, V> property) {
    final YgDisposableDrivenProperty<V> listenable = property.drive(
      controller: controller,
      vsync: vsync,
    );

    _properties.add(listenable);
    listenable.addListener(notifyListeners);

    return listenable;
  }
}
