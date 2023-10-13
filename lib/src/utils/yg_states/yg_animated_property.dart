import 'package:flutter/material.dart';
import 'package:yggdrasil/src/utils/yg_states/yg_property.dart';

import 'yg_animated_style.dart';

// ignore: avoid-dynamic
typedef DynamicAnimation = Animation<dynamic>;
typedef YgPropertyResolver<T extends Enum, V> = V Function(BuildContext context, Set<T> states);
typedef Interpolator<T> = T Function(double t, T from, T to);

class YgAnimatedProperty<T extends Enum, V> extends Animation<V>
    with AnimationWithParentMixin<double>
    implements YgProperty<T, V> {
  YgAnimatedProperty.fromStyle(
    YgAnimatedStyle<T> this.parent,
    this._resolve, [
    this._interpolator,
  ]);

  @override
  final Animation<double> parent;

  /// Resolves the value of the property given a set of states and a context.
  final YgPropertyResolver<T, V> _resolve;

  /// Interpolates between 2 values.
  final Interpolator<V>? _interpolator;

  /// The value this property animates from.
  V? from;

  /// The value this property animates to.
  V? to;

  /// Interpolate between 2 values.
  ///
  /// This method may be overwritten to implement custom typed properties.
  V lerp(double t, V from, V to) {
    final Interpolator<V>? interpolator = this._interpolator;

    // Fall back on simple interpolation when there is no user specified one.
    if (interpolator == null) {
      if (to == null) {
        return from;
      } else if (from == null) {
        return to;
      }

      if (t > 0.5) {
        return to;
      }

      return from;
    }

    return interpolator(t, from, to);
  }

  /// Resolves the value for given states.
  @override
  V resolve(
    BuildContext context,
    Set<T> states,
  ) {
    return _resolve(
      context,
      states,
    );
  }

  @override
  V get value {
    assert(
      from != null && to != null,
      'value was accessed before ${toString()} was initialized',
    );

    return lerp(
      parent.value,
      from as V,
      to as V,
    );
  }
}
