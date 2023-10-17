// ignore_for_file: avoid-dynamic

import 'package:flutter/material.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

abstract class YgStyle<T extends Enum> extends ChangeNotifier {
  YgStyle({
    required this.controller,
    required this.updater,
  }) {
    init();
  }

  final YgStatesController<T> controller;
  final YgUpdateMixin updater;
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

  YgAnimatedProperty<V> animate<V>(
    YgProperty<T, V> property, {
    required Duration duration,
    required Curve curve,
  }) {
    final YgAnimatedProperty<V> listenable = property.animate(
      controller: controller,
      updater: updater,
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
      updater: updater,
    );

    _properties.add(listenable);
    listenable.addListener(notifyListeners);

    return listenable;
  }
}
