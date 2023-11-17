// ignore_for_file: avoid-dynamic

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
    required this.vsync,
  }) {
    init();
  }

  final T state;
  final YgVsync vsync;
  final List<YgDisposableDrivenProperty<dynamic>> _properties = <YgDisposableDrivenProperty<dynamic>>[];

  void init();

  @override
  void dispose() {
    for (final YgDisposableDrivenProperty<dynamic> property in _properties) {
      property.removeListener(notifyListeners);
      property.dispose();
    }
    super.dispose();
  }

  BuildContext get context => vsync.context;
}
