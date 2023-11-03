import 'package:flutter/material.dart';
import 'package:yggdrasil/src/utils/yg_states/_yg_states.dart';
import 'package:yggdrasil/src/utils/yg_states/helpers/_helpers.dart';

part 'yg_animated_property.dart';
part 'yg_driven_property.dart';
part 'yg_driven_property_all.dart';
part 'yg_property_resolve_all.dart';
part 'yg_property_resolve_with.dart';

typedef YgStatesResolver<T extends YgState, V> = V Function(BuildContext, T);
typedef YgStatesAllResolver<V> = V Function(BuildContext);

/// A property which resolves its value using a set of states.
///
/// Can be animated using [animate] or using [YgStyle.animate].
/// Can be driven using [drive] or using [YgStyle.drive].
///
/// Is not compatible with [MaterialStateProperty] since this property will
/// provide the resolve function with a [BuildContext].
abstract class YgProperty<T extends YgState, V> {
  const YgProperty();

  /// Resolves this property using the passed [resolver].
  ///
  /// Preferred way of using a property when using a [YgStyle].
  const factory YgProperty.resolveWith(
    YgStatesResolver<T, V> resolver,
  ) = _YgPropertyResolveWith<T, V>;

  /// Resolves this property using the passed [resolver].
  ///
  /// Only resolves the property on build and dependency changes as states do
  /// not influence the values of this property. May be useful when using
  /// [YgStyle] while having some logic that has to be applied to a theme value
  /// which you do not want to place inside the widget.
  const factory YgProperty.all(
    YgStatesAllResolver<V> resolver,
  ) = _YgPropertyResolveAll<T, V>;

  /// Resolves the value for a given set of [states].
  V resolve(BuildContext context, T states);

  /// Creates a tween which interpolates between 2 value of type [V].
  ///
  /// When not overwritten will try and find a tween which matches V, this may
  /// not always work if [TweenFactory] is not updated to support [V]. When a
  /// value is not animated correctly pleas check [TweenFactory] to make sure
  /// this value (or a class it extends) is supported.
  Tween<V> createTween(V initialValue) {
    return TweenFactory.createTween(
      initialValue,
    );
  }

  /// Animate this property.
  ///
  /// Will resolve the value when states change and start animating to the new
  /// value if the value has changed.
  YgDisposableAnimatedProperty<V> animate({
    required T state,
    required YgVsync vsync,
    required Duration duration,
    required Curve curve,
  }) {
    return _YgAnimatedProperty<T, V>(
      state: state,
      vsync: vsync,
      curve: curve,
      duration: duration,
      property: this,
    );
  }

  /// Drive this property.
  ///
  /// Will resolve the value when states change. Does not animate this property,
  /// but creates a [YgDrivenProperty] which notifies you about when the value
  /// of this property changes. Use this when you have a value which depends on
  /// states but can no be animated, for example, a [MouseCursor].
  YgDisposableDrivenProperty<V> drive({
    required T state,
    required YgVsync vsync,
  }) {
    return _YgDrivenProperty<T, V>(
      state: state,
      vsync: vsync,
      property: this,
    );
  }
}
