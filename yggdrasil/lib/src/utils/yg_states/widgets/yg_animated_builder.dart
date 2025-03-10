part of yg_states;

// ignore_for_file: always-remove-listener


/// Similar to [AnimatedBuilder] but accepts multiple properties instead.
class YgAnimatedBuilder extends StatefulWidget {
  const YgAnimatedBuilder({
    super.key,
    required this.properties,
    required this.builder,
    this.child,
  });

  final Set<Listenable?> properties;
  final TransitionBuilder builder;
  final Widget? child;

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
    super.didUpdateWidget(oldWidget);
    final Set<Listenable?> added = widget.properties.difference(oldWidget.properties);
    final Set<Listenable?> removed = oldWidget.properties.difference(widget.properties);

    for (final Listenable? property in removed) {
      property?.removeListener(_rebuild);
    }
    for (final Listenable? property in added) {
      property?.addListener(_rebuild);
    }
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
    return widget.builder(
      context,
      widget.child,
    );
  }
}
