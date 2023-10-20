// ignore_for_file: avoid-dynamic

import 'package:flutter/widgets.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

part 'yg_style.dart';
part 'yg_style_with_defaults.dart';

abstract class YgStyleBase<T extends Enum> extends ChangeNotifier {
  YgStyleBase({
    required this.controller,
    required this.vsync,
  }) {
    init();
  }

  final YgStatesController<T> controller;
  final YgVsync vsync;
  final List<YgDrivenProperty<dynamic>> _properties = <YgDrivenProperty<dynamic>>[];

  void init();

  @override
  void dispose() {
    for (final YgDrivenProperty<dynamic> property in _properties) {
      property.removeListener(notifyListeners);
      property.dispose();
    }
    super.dispose();
  }

  BuildContext get context => vsync.context;
}
