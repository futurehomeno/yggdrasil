// ignore_for_file: always-remove-listener

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

  Set<YgDynamicAnimatedProperty<T>> get animatedProperties;
}

abstract class YgAnimatedWidgetState<T extends Enum, W extends YgAnimatedWidget<T>> extends State<W> {
  @override
  void initState() {
    super.initState();

    for (final YgDynamicAnimatedProperty<T> property in widget.animatedProperties) {
      property.addListener(_handleAnimationChanged);
    }
  }

  void _handleAnimationChanged() {
    setState(() {});
  }

  @override
  void didUpdateWidget(covariant W oldWidget) {
    final Set<YgDynamicAnimatedProperty<T>> added = widget.animatedProperties.difference(
      oldWidget.animatedProperties,
    );
    for (final YgDynamicAnimatedProperty<T> property in added) {
      property.addListener(_handleAnimationChanged);
    }

    final Set<YgDynamicAnimatedProperty<T>> removed = oldWidget.animatedProperties.difference(
      widget.animatedProperties,
    );
    for (final YgDynamicAnimatedProperty<T> property in removed) {
      property.removeListener(_handleAnimationChanged);
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    for (final YgDynamicAnimatedProperty<T> property in widget.animatedProperties) {
      property.removeListener(_handleAnimationChanged);
    }
    super.dispose();
  }
}
