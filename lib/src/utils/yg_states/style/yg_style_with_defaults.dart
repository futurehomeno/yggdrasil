part of 'yg_style_base.dart';

abstract class YgStyleWithDefaults<T extends Enum> extends YgStyleBase<T> {
  YgStyleWithDefaults({
    required super.controller,
    required super.vsync,
  });

  YgAnimatedProperty<V> animate<V>(
    YgProperty<T, V> property, {
    Duration? duration,
    Curve? curve,
  }) {
    final YgAnimatedProperty<V> listenable = property.animate(
      controller: controller,
      vsync: vsync,
      curve: curve ?? this.curve,
      duration: duration ?? this.duration,
    );

    _properties.add(listenable);
    listenable.addListener(notifyListeners);

    return listenable;
  }

  YgDrivenProperty<V> drive<V>(YgProperty<T, V> property) {
    final YgDrivenProperty<V> listenable = property.drive(
      controller: controller,
      vsync: vsync,
    );

    _properties.add(listenable);
    listenable.addListener(notifyListeners);

    return listenable;
  }

  Duration get duration;

  Curve get curve;
}
