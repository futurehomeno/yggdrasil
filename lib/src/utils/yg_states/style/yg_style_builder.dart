import 'package:flutter/material.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

typedef YgWatchedPropertiesGetter<S extends YgStyleBase<Enum>> = Set<Listenable> Function(S style);
typedef YgStyleCreator<S extends YgStyleBase<Enum>> = S Function(YgVsync vsync);
typedef YgStyleChildBuilder<S extends YgStyleBase<Enum>> = Widget Function(BuildContext context, S style);

@optionalTypeArgs
class YgStyleBuilder<S extends YgStyleBase<Enum>> extends StatefulWidget {
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

class _YgStyleBuilderState<S extends YgStyleBase<Enum>> extends State<YgStyleBuilder<S>>
    with TickerProviderStateMixin, YgVsyncMixin {
  S? _style;
  final Set<Listenable> _subscriptions = <Listenable>{};

  S _getStyle() {
    S? style = _style;

    if (style == null) {
      style = widget.createStyle(this);

      final YgWatchedPropertiesGetter<S>? getWatchedProperties = widget.getWatchedProperties;
      if (getWatchedProperties != null) {
        _subscriptions.addAll(
          getWatchedProperties(style),
        );

        for (final Listenable subscription in _subscriptions) {
          subscription.addListener(_rebuild);
        }
      }
    }

    _style = style;

    return style;
  }

  void _rebuild() {}

  @override
  void dispose() {
    _style?.dispose();
    for (final Listenable subscription in _subscriptions) {
      subscription.removeListener(_rebuild);
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(
      context,
      _getStyle(),
    );
  }
}
