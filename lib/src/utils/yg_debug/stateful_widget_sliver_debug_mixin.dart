import 'package:flutter/widgets.dart';

import '_yg_debug.dart';

/// Wraps built widget in YgDebugWidget.
mixin StatefulWidgetSliverDebugMixin on StatefulWidget {
  @override
  StatefulElement createElement() => _YgDebugStatefulElement(this, debugType);

  YgDebugType get debugType => YgDebugType.other;
}

class _YgDebugStatefulElement extends StatefulElement {
  _YgDebugStatefulElement(super.widget, this._type);

  final YgDebugType _type;

  @override
  Widget build() {
    return YgDebug.sliver(
      type: _type,
      child: super.build(),
    );
  }
}
