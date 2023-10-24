import 'package:flutter/material.dart';

import '_yg_states.dart';
import 'tween_factory.dart';

part 'yg_animated_property.dart';
part 'yg_driven_property.dart';

typedef YgStatesResolver<T extends Enum, V> = V Function(BuildContext, Set<T>);
typedef YgStatesAllResolver<V> = V Function(BuildContext);
typedef YgMaterialProperty<V> = YgProperty<MaterialState, V>;

abstract class YgProperty<T extends Enum, V> {
  const YgProperty();

  const factory YgProperty.resolveWith(
    YgStatesResolver<T, V> resolver,
  ) = _YgPropertyResolveWith<T, V>;

  const factory YgProperty.all(
    YgStatesAllResolver<V> resolver,
  ) = _YgPropertyResolveAll<T, V>;

  /// Resolves the value for a given set of [states].
  V resolve(BuildContext context, Set<T> states);

  Tween<V> createTween(V initialValue) {
    return TweenFactory.createTween(
      initialValue,
    );
  }

  YgDisposableAnimatedProperty<V> animate({
    required YgStatesController<T> controller,
    required YgVsync vsync,
    required Duration duration,
    required Curve curve,
  }) {
    return _YgAnimatedProperty<T, V>(
      controller: controller,
      vsync: vsync,
      curve: curve,
      duration: duration,
      property: this,
    );
  }

  YgDisposableDrivenProperty<V> drive({
    required YgStatesController<T> controller,
    required YgVsync vsync,
  }) {
    return _YgDrivenProperty<T, V>(
      controller: controller,
      vsync: vsync,
      property: this,
    );
  }
}

mixin YgPropertyResolveWithMixin<T extends Enum, V> on YgProperty<T, V> {
  YgStatesResolver<T, V> get resolver;

  @override
  V resolve(BuildContext context, Set<T> states) {
    return resolver(context, states);
  }
}

class _YgPropertyResolveWith<T extends Enum, V> extends YgProperty<T, V> with YgPropertyResolveWithMixin<T, V> {
  const _YgPropertyResolveWith(this.resolver);

  @override
  final YgStatesResolver<T, V> resolver;
}

mixin YgPropertyResolveAllMixin<T extends Enum, V> on YgProperty<T, V> {
  YgStatesAllResolver<V> get resolver;

  @override
  V resolve(BuildContext context, Set<T> states) {
    return resolver(context);
  }
}

class _YgPropertyResolveAll<T extends Enum, V> extends YgProperty<T, V> with YgPropertyResolveAllMixin<T, V> {
  const _YgPropertyResolveAll(this.resolver);

  @override
  final YgStatesAllResolver<V> resolver;
}
