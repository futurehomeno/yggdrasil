import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

/// Simplifies animating or driving properties.
///
/// Should be extended to create custom style classes for a widget.
///
/// Allows you to animate or drive resolver methods directly instead of having
/// to manually create and keep track of [YgProperty] classes.
///
/// Provides [state] and [context] on the class it self rather than passing it
/// to the resolvers.
///
/// Notifies its listeners if any of the properties update.
abstract class YgStyle<T extends YgState> extends ChangeNotifier {
  YgStyle({
    required this.state,
    required YgVsync vsync,
  }) : _vsync = vsync;

  @protected
  final T state;
  final YgVsync _vsync;
  final List<YgDisposableDrivenProperty<Object?>> _properties = <YgDisposableDrivenProperty<Object?>>[];
  bool _scheduledUpdate = false;

  @override
  void dispose() {
    for (final YgDisposableDrivenProperty<Object?> property in _properties) {
      property.removeListener(_scheduleUpdate);
      property.dispose();
    }
    super.dispose();
  }

  /// Debounce the updates.
  void _scheduleUpdate() {
    if (_scheduledUpdate) {
      return;
    }

    _scheduledUpdate = true;

    scheduleMicrotask(() {
      _scheduledUpdate = false;

      if (hasListeners) {
        notifyListeners();
      }
    });
  }

  BuildContext get context => _vsync.context;

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
