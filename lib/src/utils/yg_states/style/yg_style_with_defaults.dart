part of 'yg_style_base.dart';

/// Simplifies animating or driving properties.
///
/// Primarily used to clean up the use of [YgProperty]. Using [YgStyle.animate]
/// or [YgStyle.drive] instead of [YgProperty.animate] or [YgProperty.drive] has
/// the advantage that the style will provide the [state], [_vsync],
/// [duration] and [curve]. The style also disposes of the properties for you when
/// the style is disposed.
abstract class YgStyleWithDefaults<T extends YgState> extends YgStyleBase<T> {
  YgStyleWithDefaults({
    required super.state,
    required super.vsync,
  });

  /// Animate a property.
  ///
  /// [duration] and [curve] can be overwritten if needed. If all widgets in
  /// this style have a different duration and curve, look in to using [YgStyle]
  /// instead.
  YgAnimatedProperty<V> animate<V>(
    V Function() resolver, {
    Duration? duration,
    Curve? curve,
  }) {
    final YgProperty<T, V> property = YgProperty<T, V>.resolveWith(
      (_, __) => resolver(),
    );

    final YgDisposableAnimatedProperty<V> listenable = property.animate(
      state: state,
      vsync: _vsync,
      curve: curve ?? this.curve,
      duration: duration ?? this.duration,
    );

    _properties.add(listenable);
    listenable.addListener(_scheduleUpdate);

    return listenable;
  }

  /// Drive a property.
  YgDrivenProperty<V> drive<V>(V Function() resolver) {
    final YgProperty<T, V> property = YgProperty<T, V>.resolveWith(
      (_, __) => resolver(),
    );

    final YgDisposableDrivenProperty<V> listenable = property.drive(
      state: state,
      vsync: _vsync,
    );

    _properties.add(listenable);
    listenable.addListener(_scheduleUpdate);

    return listenable;
  }

  /// Drive a property with a non state based value.
  YgDrivenProperty<V> all<V>(V Function() resolver) {
    final YgProperty<T, V> property = YgProperty<T, V>.all(
      (_) => resolver(),
    );

    final YgDisposableDrivenProperty<V> listenable = property.drive(
      state: state,
      vsync: _vsync,
    );

    _properties.add(listenable);
    listenable.addListener(_scheduleUpdate);

    return listenable;
  }

  /// The default duration provided to all property when using [animate].
  Duration get duration;

  /// The default curve provided to all property when using [animate].
  Curve get curve;
}
