import 'package:flutter/widgets.dart';

import '_yg_debug.dart';

/// Wraps built widget in YgDebugWidget.
mixin StatefulWidgetSliverDebugMixin on StatefulWidget {
  @override
  StatefulElement createElement() => _YgDebugStatefulElementForSlivers(this, () => debugType);

  YgDebugType get debugType => YgDebugType.other;
}

class _YgDebugStatefulElementForSlivers extends StatefulElement {
  _YgDebugStatefulElementForSlivers(super.widget, this._getType);

  final YgDebugType Function() _getType;

  @override
  Widget build() {
    return YgDebug.sliver(
      type: _getType(),
      child: super.build(),
    );
  }
}
