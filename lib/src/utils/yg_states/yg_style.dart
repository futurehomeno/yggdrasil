// ignore_for_file: avoid-dynamic

import 'package:flutter/material.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

abstract class _YgStyleBase<T extends Enum> extends ChangeNotifier {
  _YgStyleBase({
    required this.controller,
    required this.vsync,
  }) {
    init();
  }

  final YgStatesController<T> controller;
  final YgVsync vsync;
  final List<YgDrivenProperty<dynamic>> _properties = <YgDrivenProperty<dynamic>>[];

  void init();

  @override
  void dispose() {
    for (final YgDrivenProperty<dynamic> property in _properties) {
      property.removeListener(notifyListeners);
      property.dispose();
    }
    super.dispose();
  }

  BuildContext get context => vsync.context;
}

abstract class YgStyle<T extends Enum> extends _YgStyleBase<T> {
  YgStyle({
    required super.controller,
    required super.vsync,
  });

  YgAnimatedProperty<V> animate<V>(
    YgProperty<T, V> property, {
    required Duration duration,
    required Curve curve,
  }) {
    final YgAnimatedProperty<V> listenable = property.animate(
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
    final YgDrivenProperty<V> listenable = property.drive(
      controller: controller,
      vsync: vsync,
    );

    _properties.add(listenable);
    listenable.addListener(notifyListeners);

    return listenable;
  }
}

abstract class YgStyleWithDefaults<T extends Enum> extends _YgStyleBase<T> {
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
