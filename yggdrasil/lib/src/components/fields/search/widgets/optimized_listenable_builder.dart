import 'package:flutter/material.dart';

/// Allows you to build when only a specific value on a listenable changes.
///
/// More efficient than a normal [ListenableBuilder] in cases where a listenable
/// has multiple values which change a lot independent of each other, and you
/// only need one value.
class OptimizedListenableBuilder<T> extends StatefulWidget {
  const OptimizedListenableBuilder({
    super.key,
    required this.getValue,
    required this.builder,
    required this.listenable,
    this.child,
  });

  final T Function() getValue;
  final Widget Function(BuildContext context, T value, Widget? child) builder;
  final Listenable listenable;
  final Widget? child;

  @override
  State<OptimizedListenableBuilder<T>> createState() => _OptimizedListenableBuilderState<T>();
}

class _OptimizedListenableBuilderState<T> extends State<OptimizedListenableBuilder<T>> {
  T? _value;

  @override
  void initState() {
    super.initState();
    _value = widget.getValue();
    widget.listenable.addListener(_onControllerUpdated);
  }

  @override
  void didUpdateWidget(covariant OptimizedListenableBuilder<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.listenable != widget.listenable) {
      oldWidget.listenable.removeListener(_onControllerUpdated);
      widget.listenable.addListener(_onControllerUpdated);
    }
  }

  @override
  void dispose() {
    widget.listenable.removeListener(_onControllerUpdated);

    super.dispose();
  }

  void _onControllerUpdated() {
    final T newValue = widget.getValue();
    if (newValue != _value) {
      setState(() {});
      _value = newValue;
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(
      context,
      _value ?? widget.getValue(),
      widget.child,
    );
  }
}
