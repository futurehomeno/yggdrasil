import 'package:flutter/material.dart';

class OptimizedListenableBuilder extends StatefulWidget {
  const OptimizedListenableBuilder({
    super.key,
    required this.getValue,
    required this.builder,
    required this.listenable,
    this.child,
  });

  final Object? Function() getValue;
  final TransitionBuilder builder;
  final Listenable listenable;
  final Widget? child;

  @override
  State<OptimizedListenableBuilder> createState() => _OptimizedListenableBuilderState();
}

class _OptimizedListenableBuilderState extends State<OptimizedListenableBuilder> {
  late Object? _previous;

  @override
  void initState() {
    super.initState();
    _previous = widget.getValue();
    widget.listenable.addListener(_onControllerUpdated);
  }

  @override
  void didUpdateWidget(covariant OptimizedListenableBuilder oldWidget) {
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
    final Object? current = widget.getValue();
    if (current != _previous) {
      setState(() {});
      _previous = current;
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(
      context,
      widget.child,
    );
  }
}
