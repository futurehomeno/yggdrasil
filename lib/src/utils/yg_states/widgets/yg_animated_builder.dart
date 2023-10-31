// ignore_for_file: always-remove-listener

import 'package:flutter/material.dart';

/// Similar to [AnimatedBuilder] but accepts multiple properties instead.
class YgAnimatedBuilder extends StatefulWidget {
  const YgAnimatedBuilder({
    super.key,
    required this.properties,
    required this.builder,
  });

  final Set<Listenable?> properties;
  final WidgetBuilder builder;

  @override
  State<YgAnimatedBuilder> createState() => _YgAnimatedBuilderState();
}

class _YgAnimatedBuilderState extends State<YgAnimatedBuilder> {
  @override
  void initState() {
    super.initState();

    for (final Listenable? property in widget.properties) {
      property?.addListener(_rebuild);
    }
  }

  @override
  void didUpdateWidget(covariant YgAnimatedBuilder oldWidget) {
    final Set<Listenable?> added = widget.properties.difference(oldWidget.properties);
    final Set<Listenable?> removed = oldWidget.properties.difference(widget.properties);

    for (final Listenable? property in removed) {
      property?.removeListener(_rebuild);
    }
    for (final Listenable? property in added) {
      property?.addListener(_rebuild);
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    for (final Listenable? property in widget.properties) {
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
