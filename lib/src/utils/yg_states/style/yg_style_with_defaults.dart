part of 'yg_style_base.dart';

/// Simplifies animating or driving properties.
///
/// Primarily used to clean up the use of [YgProperty]. Using [YgStyle.animate]
/// or [YgStyle.drive] instead of [YgProperty.animate] or [YgProperty.drive] has
/// the advantage that the style will provide the [_state], [_vsync],
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
    YgProperty<T, V> property, {
    Duration? duration,
    Curve? curve,
  }) {
    final YgDisposableAnimatedProperty<V> listenable = property.animate(
      state: _state,
      vsync: _vsync,
      curve: curve ?? this.curve,
      duration: duration ?? this.duration,
    );

    _properties.add(listenable);
    listenable.addListener(_scheduleUpdate);

    return listenable;
  }

  /// Drive a property.
  YgDrivenProperty<V> drive<V>(YgProperty<T, V> property) {
    final YgDisposableDrivenProperty<V> listenable = property.drive(
      state: _state,
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
