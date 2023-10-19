// ignore_for_file: always-remove-listener

import 'package:flutter/material.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

class YgAnimatedBuilder extends StatefulWidget {
  const YgAnimatedBuilder({
    super.key,
    required this.properties,
    required this.builder,
  });

  final Set<YgDynamicDrivenProperty?> properties;
  final WidgetBuilder builder;

  @override
  State<YgAnimatedBuilder> createState() => _YgAnimatedBuilderState();
}

class _YgAnimatedBuilderState extends State<YgAnimatedBuilder> {
  @override
  void initState() {
    super.initState();

    for (final YgDynamicDrivenProperty? property in widget.properties) {
      property?.addListener(_rebuild);
    }
  }

  @override
  void didUpdateWidget(covariant YgAnimatedBuilder oldWidget) {
    final Set<YgDynamicDrivenProperty?> added = widget.properties.difference(oldWidget.properties);
    final Set<YgDynamicDrivenProperty?> removed = oldWidget.properties.difference(widget.properties);

    for (final YgDynamicDrivenProperty? property in removed) {
      property?.removeListener(_rebuild);
    }
    for (final YgDynamicDrivenProperty? property in added) {
      property?.addListener(_rebuild);
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    for (final YgDynamicDrivenProperty? property in widget.properties) {
      property?.removeListener(_rebuild);
    }
    super.dispose();
  }

  void _rebuild() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context);
  }
}
