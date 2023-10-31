import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

class YgStatesBuilder<T extends Enum> extends StatefulWidget {
  const YgStatesBuilder({
    super.key,
    required this.controller,
    required this.builder,
    this.filter,
  });

  /// Triggers a rebuild on state change.
  final YgStatesController<T> controller;

  /// Builds the child when states change in [controller].
  ///
  /// When [filter] is supplied only rebuilds when one of the states in the
  /// filter is changed.
  final Widget Function(
    BuildContext context,
    Set<T> states,
  ) builder;

  /// Filters on which state changes the widget is rebuild.
  final Set<T>? filter;

  @override
  State<YgStatesBuilder<T>> createState() => _YgStatesBuilderState<T>();
}

class _YgStatesBuilderState<T extends Enum> extends State<YgStatesBuilder<T>> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_maybeRebuild);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_maybeRebuild);
    super.dispose();
  }

  void _maybeRebuild() {
    final Set<T>? filter = widget.filter;
    final StatesChange<T> change = widget.controller.lastChange;
    if (filter == null || change.added.any(filter.contains) || change.removed.any(filter.contains)) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(
      context,
      widget.controller.value,
    );
  }
}
