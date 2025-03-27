import 'package:flutter/material.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

/// Mixin to simplify working with [YgStyle].
mixin YgStyleBuilderMixin<W extends StatefulWidget, S extends YgStyle<YgState>> on YgVsyncMixin<W> implements YgVsync {
  late final Set<Listenable> _watchedProperties = <Listenable>{};
  S? _style;

  S get style {
    S? style = _style;
    if (style != null) {
      return style;
    }

    style = createStyle();
    _style = style;

    return style;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }

      _style ??= createStyle();
      _watchedProperties.addAll(getWatchedProperties());

      for (final Listenable property in _watchedProperties) {
        property.addListener(_rebuild);
      }
    });
  }

  void _rebuild() {
    setState(() {});
  }

  @override
  void dispose() {
    style.dispose();
    for (final Listenable property in _watchedProperties) {
      property.removeListener(_rebuild);
    }

    super.dispose();
  }

  /// Creates style on init.
  ///
  /// The style will be provided to [builder] for the lifetime of this widget.
  S createStyle();

  /// Optionally select properties to trigger a rebuild when changed.
  ///
  /// !--- Warning ---
  /// Not the most performant way to animate properties as this will rebuild the
  /// entire widget every type any of the watched properties is changed. Ideally
  /// you should only use this for properties which are driven and can not be
  /// animated. If you want to animate properties use the one of the animated
  /// widgets, any of the build in Transition widgets, a [AnimatedBuilder] or a
  /// [YgAnimatedBuilder] instead.
  Set<Listenable> getWatchedProperties() => <Listenable>{};
}
