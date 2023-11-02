import 'package:flutter/material.dart';
import 'package:yggdrasil/src/utils/yg_states/_yg_states.dart';

typedef YgWatchedPropertiesGetter<S extends YgStyleBase<YgState>> = Set<Listenable> Function(S style);
typedef YgStyleCreator<S extends YgStyleBase<YgState>> = S Function(YgVsync vsync);
typedef YgStyleChildBuilder<S extends YgStyleBase<YgState>> = Widget Function(BuildContext context, S style);

/// Creates style and provides it to [builder].
class YgStyleBuilder<S extends YgStyleBase<YgState>> extends StatefulWidget {
  const YgStyleBuilder({
    super.key,
    required this.createStyle,
    this.getWatchedProperties,
    required this.builder,
  });

  /// Creates style on init.
  ///
  /// The style will be provided to [builder] for the lifetime of this widget.
  final YgStyleCreator<S> createStyle;

  /// Optionally select properties to trigger a rebuild when changed.
  ///
  /// !--- Warning ---
  /// Not the most performant way to animate properties as this will rebuild the
  /// entire widget every type any of the watched properties is changed. Ideally
  /// you should only use this for properties which are driven and can not be
  /// animated. If you want to animate properties use the one of the animated
  /// widgets, any of the build in Transition widgets, a [AnimatedBuilder] or a
  /// [YgAnimatedBuilder] instead.
  final YgWatchedPropertiesGetter<S>? getWatchedProperties;

  /// Builds children.
  final YgStyleChildBuilder<S> builder;

  @override
  State<YgStyleBuilder<S>> createState() => _YgStyleBuilderState<S>();
}

class _YgStyleBuilderState<S extends YgStyleBase<YgState>> extends State<YgStyleBuilder<S>>
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
