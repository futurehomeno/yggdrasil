import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// A value builder for values that get altered during build time.
///
/// Useful to prevent a setState from being called during build. Not an ideal
/// solution, but sometimes the only solution.
class DelayedValueListenableBuilder<T> extends StatefulWidget {
  /// Creates a [DelayedValueListenableBuilder].
  ///
  /// The [child] is optional but is good practice to use if part of the widget
  /// subtree does not depend on the value of the [valueListenable].
  const DelayedValueListenableBuilder({
    super.key,
    required this.valueListenable,
    required this.builder,
    this.child,
  });

  /// The [ValueListenable] whose value you depend on in order to build.
  ///
  /// This widget does not ensure that the [ValueListenable]'s value is not
  /// null, therefore your [builder] may need to handle null values.
  final ValueListenable<T> valueListenable;

  /// A [ValueWidgetBuilder] which builds a widget depending on the
  /// [valueListenable]'s value.
  ///
  /// Can incorporate a [valueListenable] value-independent widget subtree
  /// from the [child] parameter into the returned widget tree.
  final ValueWidgetBuilder<T> builder;

  /// A [valueListenable]-independent widget which is passed back to the [builder].
  ///
  /// This argument is optional and can be null if the entire widget subtree the
  /// [builder] builds depends on the value of the [valueListenable]. For
  /// example, in the case where the [valueListenable] is a [String] and the
  /// [builder] returns a [Text] widget with the current [String] value, there
  /// would be no useful [child].
  final Widget? child;

  @override
  State<StatefulWidget> createState() => _DelayedValueListenableBuilderState<T>();
}

class _DelayedValueListenableBuilderState<T> extends State<DelayedValueListenableBuilder<T>> {
  late T _value;

  @override
  void initState() {
    super.initState();
    _value = widget.valueListenable.value;
    widget.valueListenable.addListener(_valueChanged);
  }

  @override
  void didUpdateWidget(DelayedValueListenableBuilder<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.valueListenable != widget.valueListenable) {
      oldWidget.valueListenable.removeListener(_valueChanged);
      _value = widget.valueListenable.value;
      widget.valueListenable.addListener(_valueChanged);
    }
  }

  @override
  void dispose() {
    widget.valueListenable.removeListener(_valueChanged);
    super.dispose();
  }

  void _valueChanged() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }

      _value = widget.valueListenable.value;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(
      context,
      _value,
      widget.child,
    );
  }
}
