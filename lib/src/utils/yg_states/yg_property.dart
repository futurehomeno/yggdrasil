import 'package:flutter/widgets.dart';

import '_yg_states.dart';

part 'yg_animated_property.dart';
part 'yg_driven_property.dart';

typedef YgStatesResolver<T extends Enum, V> = V Function(BuildContext, Set<T>);
typedef YgStatesAllResolver<V> = V Function(BuildContext);

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

  /// Interpolates between values.
  ///
  /// Should be overwritten for any value which supports interpolation.
  Tween<V> createTween(V initialValue) {
    return Tween<V>(
      begin: initialValue,
      end: initialValue,
    );
  }

  YgAnimatedProperty<V> animate({
    required YgStatesController<T> controller,
    required YgUpdateMixin updater,
    required Duration duration,
    required Curve curve,
  }) {
    return _YgAnimatedProperty<T, V>(
      controller: controller,
      vsync: updater,
      curve: curve,
      duration: duration,
      property: this,
    );
  }

  YgDrivenProperty<V> drive({
    required YgStatesController<T> controller,
    required YgUpdateMixin updater,
  }) {
    return _YgDrivenProperty<T, V>(
      controller: controller,
      vsync: updater,
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
