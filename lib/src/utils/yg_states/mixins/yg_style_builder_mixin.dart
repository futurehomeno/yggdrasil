import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

mixin YgStyleBuilderMixin<W extends StatefulWidget, T extends YgState, S extends YgStyleBase<T>>
    on TickerProviderStateMixin<W> implements YgVsync {
  final ObserverList<VoidCallback> _listeners = ObserverList<VoidCallback>();
  late final S _style = createStyle();
  late final Set<YgDynamicDrivenProperty> _watchedProperties = getWatchedProperties();

  S get style => _style;

  @override
  void initState() {
    super.initState();

    for (final YgDynamicDrivenProperty property in _watchedProperties) {
      property.addListener(_rebuild);
    }
  }

  void _rebuild() {
    setState(() {});
  }

  @override
  void dispose() {
    _style.dispose();
    for (final YgDynamicDrivenProperty property in _watchedProperties) {
      property.removeListener(_rebuild);
    }

    super.dispose();
  }

  @override
  void didChangeDependencies() {
    for (final VoidCallback listener in _listeners) {
      listener();
    }

    super.didChangeDependencies();
  }

  @override
  void addDependenciesChangedListener(VoidCallback callback) {
    _listeners.add(callback);
  }

  @override
  void removeDependenciesChangedListener(VoidCallback callback) {
    _listeners.remove(callback);
  }

  S createStyle();

  Set<YgDynamicDrivenProperty> getWatchedProperties() => <YgDynamicDrivenProperty>{};
}
