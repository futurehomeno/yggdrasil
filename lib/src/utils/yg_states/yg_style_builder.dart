import 'package:flutter/material.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

// ignore: always_specify_types
typedef YgAnyStyle = YgStyle;

typedef YgWatchedPropertiesGetter<S extends YgAnyStyle> = List<Listenable> Function(S style);
typedef YgStyleCreator<S extends YgAnyStyle> = S Function(YgVsync vsync);
typedef YgStyleChildBuilder<S extends YgAnyStyle> = Widget Function(BuildContext context, S style);

@optionalTypeArgs
// ignore: always_specify_types
class YgStyleBuilder<S extends YgStyle> extends StatefulWidget {
  const YgStyleBuilder({
    super.key,
    required this.createStyle,
    this.getWatchedProperties,
    required this.builder,
  });

  final YgStyleCreator<S> createStyle;
  final YgWatchedPropertiesGetter<S>? getWatchedProperties;
  final YgStyleChildBuilder<S> builder;

  @override
  State<YgStyleBuilder<S>> createState() => _YgStyleBuilderState<S>();
}

class _YgStyleBuilderState<S extends YgAnyStyle> extends State<YgStyleBuilder<S>>
    with TickerProviderStateMixin, YgVsyncMixin {
  late S _style;
  final List<Listenable> _subscriptions = <Listenable>[];

  @override
  void initState() {
    super.initState();
    _style = widget.createStyle(this);

    final YgWatchedPropertiesGetter<S>? getWatchedProperties = widget.getWatchedProperties;
    if (getWatchedProperties != null) {
      _subscriptions.addAll(
        getWatchedProperties(_style),
      );

      for (final Listenable subscription in _subscriptions) {
        subscription.addListener(_rebuild);
      }
    }
  }

  void _rebuild() {}

  @override
  void dispose() {
    _style.dispose();
    for (final Listenable subscription in _subscriptions) {
      subscription.removeListener(_rebuild);
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(
      context,
      _style,
    );
  }
}
