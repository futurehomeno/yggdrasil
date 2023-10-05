import 'package:flutter/material.dart';
import 'package:yggdrasil/src/utils/yg_states/_yg_states.dart';

abstract class YgAnimatedWidget<T extends Enum> extends StatefulWidget {
  const YgAnimatedWidget({
    super.key,
    required this.controller,
    required this.curve,
    required this.duration,
  });

  final YgStatesController<T> controller;
  final Curve curve;
  final Duration duration;
}

abstract class YgAnimatedWidgetState<T extends Enum, W extends YgAnimatedWidget<T>> extends State<W>
    with TickerProviderStateMixin {
  @override
  void didUpdateWidget(covariant W oldWidget) {}

  YgAnimatedStatesProperty<T, V> createAnimatedProperty<V>(
    YgStatesProperty<T, V> property,
  ) {
    return YgAnimatedStatesProperty<T, V>(
      property: property,
      controller: widget.controller,
      curve: widget.curve,
      duration: widget.duration,
      vsync: this,
    );
  }

  // forEachProperty
}
