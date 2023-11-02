part of 'yg_style_base.dart';

/// Slightly simplifies animating or driving properties.
///
/// Primarily used to clean up the use of [YgProperty]. Using [YgStyle.animate]
/// or [YgStyle.drive] instead of [YgProperty.animate] or [YgProperty.drive] has
/// the advantage that the style will provide the [state] and [vsync]. The
/// style also disposes of the properties for you when the style is disposed.
///
/// The duration and curve still need to be provided when using [animate] or
/// [drive]. If you use the same duration and curve for every or most properties
/// use [YgStyleWithDefaults] instead.
abstract class YgStyle<T extends YgState> extends YgStyleBase<T> {
  YgStyle({
    required super.state,
    required super.vsync,
  });

  /// Animate a property.
  YgAnimatedProperty<V> animate<V>(
    YgProperty<T, V> property, {
    required Duration duration,
    required Curve curve,
  }) {
    final YgDisposableAnimatedProperty<V> listenable = property.animate(
      state: state,
      vsync: vsync,
      curve: curve,
      duration: duration,
    );

    _properties.add(listenable);
    listenable.addListener(notifyListeners);

    return listenable;
  }

  /// Drive a property.
  YgDrivenProperty<V> drive<V>(YgProperty<T, V> property) {
    final YgDisposableDrivenProperty<V> listenable = property.drive(
      state: state,
      vsync: vsync,
    );

    _properties.add(listenable);
    listenable.addListener(notifyListeners);

    return listenable;
  }
}
