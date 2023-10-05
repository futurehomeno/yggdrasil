import 'package:flutter/widgets.dart';

import '_yg_debug.dart';

/// Wraps built widget in YgDebugWidget.
mixin StatelessWidgetSliverDebugMixin on StatelessWidget {
  @override
  StatelessElement createElement() => _YgDebugStatelessElementForSlivers(this, () => debugType);

  YgDebugType get debugType => YgDebugType.other;
}

class _YgDebugStatelessElementForSlivers extends StatelessElement {
  _YgDebugStatelessElementForSlivers(super.widget, this._getType);

  final YgDebugType Function() _getType;

  @override
  Widget build() {
    return YgDebug.sliver(
      type: _getType(),
      child: super.build(),
    );
  }
}
