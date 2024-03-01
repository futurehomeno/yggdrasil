// ignore_for_file: avoid-dynamic

import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:yggdrasil/src/utils/yg_states/_yg_states.dart';

part 'yg_style.dart';
part 'yg_style_with_defaults.dart';

/// Base class for any [YgStyle].
///
/// Can not be used directly, use [YgStyle] or [YgStyleWithDefaults] instead.
abstract class YgStyleBase<T extends YgState> extends ChangeNotifier {
  YgStyleBase({
    required this.state,
    required YgVsync vsync,
  }) : _vsync = vsync {
    init();
  }

  @protected
  final T state;
  final YgVsync _vsync;
  final List<YgDisposableDrivenProperty<dynamic>> _properties = <YgDisposableDrivenProperty<dynamic>>[];
  bool _scheduledUpdate = false;

  void init() {}

  @override
  void dispose() {
    for (final YgDisposableDrivenProperty<dynamic> property in _properties) {
      property.removeListener(_scheduleUpdate);
      property.dispose();
    }
    super.dispose();
  }

  /// Debounce the updates.
  void _scheduleUpdate() {
    if (_scheduledUpdate) {
      return;
    }

    _scheduledUpdate = true;

    scheduleMicrotask(() {
      _scheduledUpdate = false;

      if (hasListeners) {
        notifyListeners();
      }
    });
  }

  BuildContext get context => _vsync.context;
}
