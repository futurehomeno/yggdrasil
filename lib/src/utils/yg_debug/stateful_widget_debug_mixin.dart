import 'package:flutter/widgets.dart';

import '_yg_debug.dart';

/// Wraps built widget in YgDebugWidget.
mixin StatefulWidgetDebugMixin on StatefulWidget {
  @override
  StatefulElement createElement() => _YgDebugStatefulElement(this, () => debugType);

  YgDebugType get debugType => YgDebugType.other;
}

class _YgDebugStatefulElement extends StatefulElement {
  _YgDebugStatefulElement(super.widget, this._getType);

  final YgDebugType Function() _getType;

  @override
  Widget build() {
    return YgDebug(
      type: _getType(),
      child: super.build(),
    );
  }
}
